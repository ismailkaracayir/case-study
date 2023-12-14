class LoginState<T> {
  final T? data;
  final String? error;
  final bool isLoading;

  const LoginState({this.data, this.error, this.isLoading = false});

  factory LoginState.loading() => const LoginState(isLoading: true);

  factory LoginState.success({required T data}) => LoginState(data: data);

  factory LoginState.error({required String message}) =>
      LoginState(error: message);
      


  LoginState<T> copyWith({T? data, String? error, bool? isLoading}) {
    return LoginState(
      data: data ?? this.data,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
