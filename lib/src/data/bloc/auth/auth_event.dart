part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthInitialEvent extends AuthEvent {}

class AuthorizationEvent extends AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final String username;
  final String password;

  const AuthLoginEvent(this.username, this.password);

  @override
  List<Object?> get props => [username, password];
}

class AuthLogoutEvent extends AuthEvent {}

class AuthRegisterEvent extends AuthEvent {
  final String username;
  final String password;
  final String name;
  final String role;

  const AuthRegisterEvent(
    this.username,
    this.password,
    this.name,
    this.role,
  );
}
