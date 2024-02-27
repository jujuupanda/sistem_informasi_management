part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
}

class UserInitialState extends UserState {
  @override
  List<Object> get props => [];
}

class UserLoadingState extends UserState {
  @override
  List<Object> get props => [];
}

class UserGetUserSuccessState extends UserState {
  final UserModel userData;

  const UserGetUserSuccessState(this.userData);

  @override
  List<Object> get props => [userData];
}

class UserGetUserErrorState extends UserState {
  @override
  List<Object> get props => [];
}

class UserAddUserSuccessState extends UserState {
  @override
  List<Object> get props => [];
}

class UserAddUserErrorState extends UserState {
  final String error;

  const UserAddUserErrorState(this.error);

  @override
  List<Object> get props => [error];
}

class UserEditUserSuccessState extends UserState {
  @override
  List<Object> get props => [];
}

class UserEditUserErrorState extends UserState {
  @override
  List<Object> get props => [];
}
