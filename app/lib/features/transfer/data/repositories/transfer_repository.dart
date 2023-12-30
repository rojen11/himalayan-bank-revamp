import 'dart:convert';

import 'package:app/core/domain/entities/response_data_entity.dart';
import 'package:app/core/utils/constants.dart';
import 'package:dio/dio.dart';

class TransferRepository {
  static Future<ResponseDataEntity<dynamic>> checkTransfer(String token,
      String accountName, String accountNumber, double amount) async {
    try {
      Dio dio = Dio();
      var res = await dio.post("$apiUrl/check-transfer",
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: json.encode({
            "account_name": accountName,
            "account_number": accountNumber,
            "amount": amount
          }));
      if (res.statusCode == 200) {
        return ResponseDataEntity(success: true);
      } else {
        return ResponseDataEntity(success: false, error: res.data["detail"]);
      }
    } on DioException catch (e) {
      return ResponseDataEntity(
          success: false,
          error: e.response?.data["detail"] ?? "Something went wrong");
    }
  }

  static Future<ResponseDataEntity<dynamic>> transfer(
      String token,
      String accountName,
      String accountNumber,
      double amount,
      String remarks) async {
    try {
      Dio dio = Dio();
      var res = await dio.post("$apiUrl/transfer",
          options: Options(headers: {"Authorization": "Bearer $token"}),
          data: json.encode({
            "destination_account": {
              "account_name": accountName,
              "account_number": accountNumber,
            },
            "amount": amount,
            "remarks": remarks
          }));
      if (res.statusCode == 200) {
        return ResponseDataEntity(success: true);
      } else {
        return ResponseDataEntity(success: false, error: res.data["detail"]);
      }
    } on DioException catch (e) {
      return ResponseDataEntity(
          success: false,
          error: e.response?.data["detail"] ?? "Something went wrong");
    }
  }
}
