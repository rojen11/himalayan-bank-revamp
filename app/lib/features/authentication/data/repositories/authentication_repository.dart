import 'package:app/core/domain/entities/response_data_entity.dart';
import 'package:app/core/utils/constants.dart';
import 'package:app/features/authentication/domian/entities/token_response_entity.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  static Future<ResponseDataEntity<TokenResponseEntity>> login(
      String phone, String password) async {
    final formData =
        FormData.fromMap({"username": phone, "password": password});

    try {
      Dio dio = Dio();
      var res = await dio.post("$apiUrl/token", data: formData);
      return ResponseDataEntity(
          success: true,
          data: TokenResponseEntity(accessToken: res.data["access_token"]));
    } on DioException catch (e) {
      return ResponseDataEntity(success: false, error: e.message);
    }
  }
}
