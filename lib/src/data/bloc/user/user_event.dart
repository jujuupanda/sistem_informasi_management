part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {}

class UserGetUserEvent extends UserEvent {}

class UserAddUserEvent extends UserEvent {
  final String username;
  final String password;
  final String name;
  final String role;

  const UserAddUserEvent(
    this.username,
    this.password,
    this.name,
    this.role,
  );
}

class UserEditUserEvent extends UserEvent {}

class UserEditUserPasswordEvent extends UserEvent {}

class UserDeleteUserEvent extends UserEvent {}
