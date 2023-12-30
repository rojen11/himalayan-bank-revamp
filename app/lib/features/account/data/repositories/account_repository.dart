import 'package:app/core/domain/entities/response_data_entity.dart';
import 'package:app/core/utils/constants.dart';
import 'package:app/features/account/domain/entities/account_entity.dart';
import 'package:dio/dio.dart';

class AccountRepository {
  static Future<ResponseDataEntity<double>> getBalance(String token) async {
    try {
      Dio dio = Dio();
      var res = await dio.get("$apiUrl/balance",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return ResponseDataEntity(success: true, data: res.data["balance"]);
    } on DioException catch (e) {
      return ResponseDataEntity(success: false, error: e.message);
    }
  }

  static Future<ResponseDataEntity<AccountEntity>> getAccount(
      String token) async {
    try {
      Dio dio = Dio();
      var res = await dio.get("$apiUrl/my-account",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return ResponseDataEntity(
          success: true,
          data: AccountEntity(
              accountNumber: res.data["account_number"],
              accountName: res.data["account_name"]));
    } on DioException catch (e) {
      return ResponseDataEntity(success: false, error: e.message);
    }
  }
}
