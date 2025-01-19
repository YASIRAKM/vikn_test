import 'package:flutter/cupertino.dart';
import 'package:vikn_test/core/constants/strings.dart';
import 'package:vikn_test/core/service/shared_preference_helper.dart';
import 'package:vikn_test/features/auth/view/login_screan.dart';
import 'package:vikn_test/main.dart';
import 'package:http/http.dart' as http;

class HttpClient {
  HttpClient();

  Future<http.Response> get({required String url}) async {
    String? accessToken =
        await SharedPrefHelper.getValue(AppStrings.accessTokenKey);

    if (accessToken == null) {
      _navigateToLogin();
      throw Exception('Access token is null');
    }

    final headers = {
      'Authorization': 'Bearer $accessToken',
    };

    return _sendGetRequest(url: url, headers: headers);
  }

  static Future<http.Response> _sendGetRequest(
      {required String url, required Map<String, String> headers}) async {
    final uri = Uri.parse(url);

    try {
      final response = await http.get(uri, headers: headers);

      if (response.statusCode == 401) {
        _navigateToLogin();
        throw Exception(
            'Unauthorized request: Access token expired or invalid.');
      }

      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<http.Response> post(
      {required String url, required Object body}) async {
    String? accessToken =
        await SharedPrefHelper.getValue(AppStrings.accessTokenKey);

    if (accessToken == null) {
      _navigateToLogin();
      throw Exception('Access token is null');
    }

    final headers = {
      'Authorization': 'Bearer $accessToken',
      'Content-Type': 'application/json',
    };

    return _sendPostRequest(url: url, body: body, headers: headers);
  }

  /// Sends a POST request for unauthenticated endpoints (e.g., login)
  Future<http.Response> postWithoutToken(
      {required String url, required Map<String, String> body}) async {
    final headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };

    return _sendPostRequest(url: url, body: body, headers: headers);
  }

  static Future<http.Response> _sendPostRequest(
      {required String url,
      required Object body,
      required Map<String, String> headers}) async {
    final uri = Uri.parse(url);

    try {
      final response = await http.post(uri, headers: headers, body: body);

      if (response.statusCode == 401) {
        _navigateToLogin();
        throw Exception(
            'Unauthorized request: Access token expired or invalid.');
      }

      return response;
    } catch (e) {
      rethrow; // Rethrow errors to be handled by the calling code
    }
  }

  static void _navigateToLogin() {
    SharedPrefHelper.clear();

    if (navigatorKey.currentState?.canPop() ?? false) {
      navigatorKey.currentState!.popUntil((route) => route.isFirst);
    }

    navigatorKey.currentState!.pushAndRemoveUntil(
      CupertinoPageRoute(builder: (context) => LoginScreen()),
      (route) => false,
    );
  }
}
