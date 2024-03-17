import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../data_source/data.dart';
import '../secure_storage/secure_storage.dart';

final dioProvider = Provider<Dio>((ref) {
  final dio = Dio();
  final storage = ref.watch(secureStorageProvider);
  dio.interceptors.add(
    CustomInterceptor(
      storage: storage,
      ref: ref,
    ),
  );
  return dio;
});


class CustomInterceptor extends Interceptor {
  final FlutterSecureStorage storage;
  final Ref ref;

  CustomInterceptor({
    required this.storage,
    required this.ref,
  });

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print('[REQ] [${options.method}] ${options.uri}');
    if (options.headers['accessToken'] == 'true') {
      options.headers.remove('accessToken');
      final token = await storage.read(key: ACCESS_TOKEN_KEY);
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    if (options.headers['refreshToken'] == 'true') {
      options.headers.remove('refreshToken');
      final token = await storage.read(key: REFRESH_TOKEN_KEY);
      options.headers.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print('[RES] [${response.requestOptions.method}] ${response.requestOptions.uri}');

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    final refreshToken = await storage.read(key: REFRESH_TOKEN_KEY);
    if (refreshToken == null) {
      return handler.reject(err);
    }

    final isStatus401 = err.response?.statusCode == 401;
    final isPathRefresh = err.requestOptions.path == '/api/auth/reissue';

    if (isStatus401 && !isPathRefresh) {
      final dio = Dio();
      try {
        final resp = await dio.post(
          'https://$ip/api/auth/reissue',
          queryParameters: {
            'refresh_token': refreshToken,
          },
        );
        final accessToken = resp.data['accessToken'];
        final options = err.requestOptions;

        options.headers.addAll({
          'Authorization': 'Bearer $accessToken',
        });

        await storage.write(key: ACCESS_TOKEN_KEY, value: accessToken);

        // 요청 재전송
        final response = await dio.fetch(options);
        return handler.resolve(response);
      } on DioException catch (error) {

        // ref.read(authProvider.notifier).logout();
        return handler.reject(error);
      }
    }

    return handler.reject(err);
  }
}
