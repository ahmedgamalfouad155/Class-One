

 class AccountState {
  //  final UserModel user;

  // AccountState({UserModel? user}) : user = user ?? UserModel.empty();

  // AccountState copyWith({UserModel? user}) {
  //   return AccountState (user: user ?? this.user);
  // }
}

final class AccountInitial extends AccountState {}
final class AccountUpdateSuccessState extends AccountState {}
