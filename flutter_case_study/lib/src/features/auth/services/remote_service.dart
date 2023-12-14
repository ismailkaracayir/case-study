import 'package:dio/dio.dart';

class RemoteAuthService {
  final dio = Dio();

  Future<Map<String, String>> login(String email, String pass) async {
    try {
      Map<String, dynamic> params = {
        "email": email,
        "password": pass,
      };
      final response = await dio.request(
        "https://reqres.in/api/login",
        data: params,
        options: Options(method: 'POST'),
      );
      print('service giriş');

      if (response.statusCode == 200) {
        print('service başarılı');

        Map<String, String> token = response.data;
        return token;
      } else {
        throw Exception('An error occurred');
      }
    } on DioException catch (e) {
      print('service hatalı');

      throw Exception(e.response!.data['error']);
    } catch (e) {
      throw Exception("Couldn't login. Is the device online?");
    }
  }
}
