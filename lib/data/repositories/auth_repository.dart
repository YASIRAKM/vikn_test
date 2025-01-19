import 'dart:convert';

import 'package:vikn_test/core/constants/strings.dart';
import 'package:vikn_test/core/service/shared_preference_helper.dart';
import 'package:vikn_test/data/api/api_client.dart';
import 'package:vikn_test/data/api/api_endpoinds.dart';

class AuthRepository {
  static final HttpClient _httpClient = HttpClient();
  static Future<(bool, String)> login(
      {required String username, required String password}) async {
    try {
      Map<String, String> params = {
        "username": username,
        "password": password,
        "is_mobile": "true"
      };

      final res = await _httpClient.postWithoutToken(
          url: ApiEndpoinds.loginUrl, body: params);

      if (res.statusCode == 200) {
        final body = jsonDecode(res.body);
        if (body["data"] != null) {
          await SharedPrefHelper.saveValue(
              AppStrings.accessTokenKey, body["data"]["access"]);
          await SharedPrefHelper.saveValue(
              AppStrings.userId, body["user_id"].toString());
          return (true, body["message"] as String);
        } else {
          return (false, body["error"] as String);
        }
      } else {
        return (false, "Failed to login");
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
