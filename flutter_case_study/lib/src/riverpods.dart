
import 'package:flutter_case_study/src/core/state/login_state.dart';
import 'package:flutter_case_study/src/features/auth/controllers/auth_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authControllerProvider = StateNotifierProvider<AuthController, LoginState>(
  (ref) => AuthController(),
  
);
