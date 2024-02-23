part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();
}

// UMUM
class AuthInitialState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object> get props => [];
}

//AUTHORIZATION
class IsAuthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

class UnAuthorizedState extends AuthState {
  @override
  List<Object> get props => [];
}

// LOGIN
class AuthLoginSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoginErrorState extends AuthState {
  final String error;

  const AuthLoginErrorState(this.error);

  @override
  List<Object> get props => [error];
}

// REGISTER
class AuthRegisterSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthRegisterErrorState extends AuthState {
  final String error;

  const AuthRegisterErrorState(this.error);

  @override
  List<Object> get props => [error];
}
//LOGOUT
class AuthLogoutSuccessState extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLogoutErrorState extends AuthState {
  @override
  List<Object> get props => [];
}
