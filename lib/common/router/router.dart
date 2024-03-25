import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mogu_mobile/auth/view/sign_in_view.dart';

import '../view/root_tab.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    // initialLocation: , 이거는 splash 화면 나왔을 떄
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RootTab(),
        routes: [
          GoRoute(
            path: 'login',
            builder: (context, state) => const SignInView(),
          )
        ],
      ),
    ],
  );
});
