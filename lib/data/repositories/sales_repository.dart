import 'dart:convert';


import 'package:vikn_test/core/constants/strings.dart';
import 'package:vikn_test/core/service/shared_preference_helper.dart';
import 'package:vikn_test/data/api/api_client.dart';
import 'package:vikn_test/data/api/api_endpoinds.dart';
import 'package:vikn_test/features/sales/model/sales_model.dart';

class SalesRepository {
  static final HttpClient _httpClient = HttpClient();

  static Future<List<SalesModel>> fetchSalesModel({required int page}) async {
    try {
      int userID =
          int.parse(await SharedPrefHelper.getValue(AppStrings.userId) ?? "0");
      if (userID == 0) {
        throw Exception();
      }
      Map<String, dynamic> body = {
        "BranchID": 1,
        "CompanyID": "1901b825-fe6f-418d-b5f0-7223d0040d08",
        "CreatedUserID": userID,
        "PriceRounding": 2,
        "page_no": page,
        "items_per_page": 10,
        "type": "Sales",
        "WarehouseID": 1,
      };
      final res = await _httpClient.post(
          url: ApiEndpoinds.salesListUrl, body: jsonEncode(body));
      if (res.statusCode == 200) {
        var body = jsonDecode(res.body);
        return salesModelFromJson(jsonEncode(body["data"]));
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception();
    }
  }
}
