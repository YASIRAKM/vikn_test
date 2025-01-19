import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:vikn_test/core/service/shared_preference_helper.dart';
import 'package:vikn_test/data/repositories/auth_repository.dart';

class AuthViewModel extends AutoDisposeAsyncNotifier<AuthState> {
  @override
  FutureOr<AuthState> build() {
    return AuthState(isAuthenticated: false, message: null);
  }

  Future<void> login({
    required String username,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    try {
      state = await AsyncValue.guard(() async {
        final (bool isSuccess, String message) =
            await AuthRepository.login(username: username, password: password);

        if (isSuccess) {
          return AuthState(isAuthenticated: true, message: null);
        } else {
          return AuthState(isAuthenticated: false, message: message);
        }
      });
    } catch (e, stack) {
      state = AsyncValue.error(e, stack);
    }
  }

  Future<bool> logout() async {
    try {
      await SharedPrefHelper.clear();

      return true;
    } catch (e) {
      return false;
    }
  }
}

final authProvider = AutoDisposeAsyncNotifierProvider<AuthViewModel, AuthState>(
  () => AuthViewModel(),
);

class AuthState {
  final bool isAuthenticated;
  final String? message;

  AuthState({
    required this.isAuthenticated,
    this.message,
  });
}
