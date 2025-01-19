import 'dart:async';
import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vikn_test/data/repositories/user_repository.dart';
import 'package:vikn_test/features/profile/model/user_model.dart';

final userProvider = AsyncNotifierProvider<UserViewModel, UserModel>(
  () => UserViewModel(),
);

class UserViewModel extends AsyncNotifier<UserModel> {
  @override
  FutureOr<UserModel> build() async {
    return await fetchUser();
  }

/*fetch user details from api */
  Future<UserModel> fetchUser() async {
    try {
      state = const AsyncValue.loading();
      final user = await UserRepository.fetchUserDetails();
      state = AsyncValue.data(user);
      log(user.toString());
      return user;
    } catch (e, stackTrace) {
      state = AsyncValue.error(e, stackTrace);
      rethrow;
    }
  }
}
