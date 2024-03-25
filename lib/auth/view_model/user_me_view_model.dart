import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../repository/auth_repository.dart';

final userMeProvider = StateNotifierProvider<UserMeViewModel, UserModelBase?>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return UserMeViewModel(
      authRepository: authRepository,
    );
  },
);

class UserMeViewModel extends StateNotifier<UserModelBase?> {
  final AuthRepository authRepository;

  UserMeViewModel({
    required this.authRepository,
  }) : super(UserModelLoading()){
    _getMe();
  }

  Future<void> signInWithEmail(String email, String password) async {
    state = UserModelLoading();
    try {
      final response = await authRepository.signInWithEmail(email, password);
      state = UserModel(user: response.user);
    } catch (e) {
      state = UserModelError(message: e.toString());
    }
  }

  Future<void> signInWithApple() async {
    state = UserModelLoading();
    try {
      final isSuccess = await authRepository.signInWithApple();
      if (isSuccess) {
        _getMe();
      } else {
        state = UserModelError(message: 'Apple sign in failed');
      }
    } catch (e) {
      state = UserModelError(message: e.toString());
    }
  }

  Future<void> signInWithKakao() async {
    state = UserModelLoading();
    try {
      final isSuccess = await authRepository.signInWithKakao();
      if (isSuccess) {
        _getMe();
      } else {
        state = UserModelError(message: 'Kakao sign in failed');
      }
    } catch (e) {
      state = UserModelError(message: e.toString());
    }
  }

  Future<void> signInWithGoogle() async {
    state = UserModelLoading();
    try {
      final isSuccess = await authRepository.signInWithGoogle();
      if (isSuccess) {
        _getMe();
      } else {
        state = UserModelError(message: 'Google sign in failed');
      }
    } catch (e) {
      state = UserModelError(message: e.toString());
    }
  }

  Future<void> signUp(String email, String password) async {
    state = UserModelLoading();
    try {
      final response = await authRepository.signUp(email, password);
      state = UserModel(user: response.user);
    } catch (e) {
      state = UserModelError(message: e.toString());
    }
  }

  Future<void> signOut() async {
    state = null;
    await authRepository.signOut();
  }
  
  Future<void> _getMe() async{
    final currentUser = authRepository.supabase.auth.currentUser;
    state = UserModel(user: currentUser);
  }
}

abstract class UserModelBase {}

class UserModelError extends UserModelBase {
  final String message;

  UserModelError({
    required this.message,
  });
}

class UserModelLoading extends UserModelBase {}


class UserModel extends UserModelBase{
  final User? user;

  UserModel({
    this.user,
  });
}

