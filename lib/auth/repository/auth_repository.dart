import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mogu_mobile/common/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final supabase = ref.watch(supabaseProvider);
  return AuthRepository(supabase);
});

class AuthRepository {
  final SupabaseClient supabase;
  AuthRepository(this.supabase);

  Future<AuthResponse> signInWithEmail(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(email: email, password: password);
      return response;
    } catch (e) {
      print('로그인에러 : $e}');
      throw Exception('로그인 중 에러가 발생했습니다.');
    }
  }

  Future<bool> signInWithApple() async{
    try {
      final response = await supabase.auth.signInWithOAuth(OAuthProvider.apple, redirectTo: 'io.supabase.flutter://reset-callback/');
      return response;
    } catch (e) {
      print('로그인에러 : $e}');
      throw Exception('로그인 중 에러가 발생했습니다.');
    }
  }
  Future<bool> signInWithKakao() async{
    try {
      final response = await supabase.auth.signInWithOAuth(OAuthProvider.kakao, redirectTo: 'io.supabase.flutter://reset-callback/');
      return response;
    } catch (e) {
      print('로그인에러 : $e}');
      throw Exception('로그인 중 에러가 발생했습니다.');
    }
  }
  Future<bool> signInWithGoogle() async{
    try {
      final response = await supabase.auth.signInWithOAuth(OAuthProvider.google, redirectTo: 'io.supabase.flutter://reset-callback/');
      return response;
    } catch (e) {
      print('로그인에러 : $e}');
      throw Exception('로그인 중 에러가 발생했습니다.');
    }
  }

  Future<AuthResponse> signUp(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(email: email ,password: password);
      return response;
    } catch (e) {
      print('회원가입에러 : $e');
      throw Exception('회원가입 중 에러가 발생했습니다.');
    }
  }

  Future<void> signOut() async{
    await supabase.auth.signOut();
  }
}

