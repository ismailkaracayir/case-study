class UserState {
  final Map<String,String>? user;

  const UserState({ required this.user});
      

  UserState copyWith({ Map<String,String>? user}) {
    return UserState(
      user: user ?? this.user,

    );
  }
}
