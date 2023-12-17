class LoginState {
  final bool isFirstSingIn;

  const LoginState({ this.isFirstSingIn = false});

  LoginState copyWith({ bool? isFirstSingIn}) {
    return LoginState(
      isFirstSingIn: isFirstSingIn ?? this.isFirstSingIn,
    );
  }
}
