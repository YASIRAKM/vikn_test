import 'package:vikn_test/core/constants/strings.dart';
import 'package:vikn_test/core/service/shared_preference_helper.dart';
import 'package:vikn_test/data/api/api_client.dart';
import 'package:vikn_test/data/api/api_endpoinds.dart';
import 'package:vikn_test/features/profile/model/user_model.dart';

class UserRepository {
  static final HttpClient _httpClient = HttpClient();

  static Future<UserModel> fetchUserDetails() async {
    try {
      int userId =
          int.parse(await SharedPrefHelper.getValue(AppStrings.userId) ?? '0');

      final res =
          await _httpClient.get(url: "${ApiEndpoinds.profileUrl}$userId");

      if (res.statusCode == 200) {
        return userModelFromJson(res.body);
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
