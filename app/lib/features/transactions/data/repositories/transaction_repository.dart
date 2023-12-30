import 'package:app/core/domain/entities/response_data_entity.dart';
import 'package:app/core/utils/constants.dart';
import 'package:app/features/transactions/domain/entities/transaction_entity.dart';
import 'package:dio/dio.dart';

class TransactionRepository {
  static Future<ResponseDataEntity<List<TransactionEntity>>> getTransactions(
      String token) async {
    try {
      Dio dio = Dio();
      var res = await dio.get("$apiUrl/transactions",
          options: Options(headers: {"Authorization": "Bearer $token"}));

      List<dynamic> transactions = res.data["transactions"];

      return ResponseDataEntity(
          success: true,
          data:
              transactions.map((e) => TransactionEntity.fromJson(e)).toList());
    } on DioException catch (e) {
      return ResponseDataEntity(success: false, error: e.message);
    }
  }
}
