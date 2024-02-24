part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {}

class UserGetUserEvent extends UserEvent {}

class UserEditUserEvent extends UserEvent {}

class UserEditUserPasswordEvent extends UserEvent {}

class UserDeleteUserEvent extends UserEvent {}
