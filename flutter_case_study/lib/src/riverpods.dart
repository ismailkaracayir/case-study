import 'package:flutter_case_study/src/core/state/user_state.dart';
import 'package:flutter_case_study/src/features/auth/controllers/user_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authProvider = StateNotifierProvider<AuthController, UserState>(
    (_) => AuthController(const UserState(user: null)));
