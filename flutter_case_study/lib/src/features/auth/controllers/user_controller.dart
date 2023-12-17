import 'package:flutter/material.dart';
import 'package:flutter_case_study/src/core/state/user_state.dart';
import 'package:flutter_case_study/src/features/auth/services/local_service.dart';
import 'package:flutter_case_study/src/features/auth/services/remote_service.dart';
import 'package:flutter_case_study/src/features/home/view/homepage.dart';
import 'package:riverpod/riverpod.dart';

class AuthController extends StateNotifier<UserState> {
  AuthController(UserState state) : super(state);
  final RemoteAuthService remoteAuthService = RemoteAuthService();
  final LocaleAuthService localeAuthService = LocaleAuthService();


  void isFirstLogin(BuildContext context)async{
  String token = await localeAuthService.readToken();
      if (token.isNotEmpty) {
        Map<String, String> userMap = {'token': token};
        state.copyWith(user: userMap);
         navigatorPage(context);
      }
  }

  Future<void> login(String email, String pass, BuildContext context) async {
    try {
    
      var user = await remoteAuthService.login(email, pass);
      state = state.copyWith(
        user: user,
      );
      navigatorPage(context);
    } catch (e) {
      state = state.copyWith();
    }
  }
}

void navigatorPage(BuildContext context) {
  Navigator.of(context).push(MaterialPageRoute(
    builder: (context) => const HomePage(),
  ));
}
