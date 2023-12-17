import 'dart:convert';

import 'package:flutter_case_study/src/features/auth/services/local_service.dart';
import 'package:http/http.dart';

class RemoteAuthService {
  final LocaleAuthService localeAuthService = LocaleAuthService();

  Future<Map<String, String>> login(String email, String pass) async {
    try {
      Response response =
          await post(Uri.parse("https://reqres.in/api/login"), body: {
        "email": email,
        "password": pass,
      });

      if (response.statusCode == 200) {
        Map<String, dynamic> token = jsonDecode(response.body);
          localeAuthService.saveToken(token['token']);
        return token.cast<String, String>();
      } else {
        throw Exception('An error occurred');
      }
    } catch (e) {
      throw Exception('An error occurred');
    }
  }
}
