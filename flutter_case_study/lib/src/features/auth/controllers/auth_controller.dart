import 'package:flutter_case_study/src/core/state/login_state.dart';
import 'package:flutter_case_study/src/features/auth/services/remote_service.dart';
import 'package:riverpod/riverpod.dart';

class AuthController extends StateNotifier<LoginState> {
  AuthController() : super(const LoginState());
  final RemoteAuthService remoteAuthService = RemoteAuthService();

  Future<void> login(String email, String pass) async {
    try {
      await remoteAuthService.login(email, pass);
    } catch (e) {
      state = LoginState.error(message: e.toString());
    } finally {
      state = state.copyWith(isLoading: false);
    }
  }
}
