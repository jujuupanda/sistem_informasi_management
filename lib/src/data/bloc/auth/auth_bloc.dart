export 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repositories/repository.dart';

part 'auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Repository repository;

  AuthBloc({required this.repository}) : super(AuthInitialState()) {
    on<AuthInitialEvent>(_authInitialEvent);
    on<AuthorizationEvent>(_authorizationEvent);
    on<AuthLoginEvent>(_authLoginEvent);
    on<AuthLogoutEvent>(_authLogoutEvent);
  }

  _authInitialEvent(AuthInitialEvent event, Emitter emit) {
    emit(AuthInitialState());
  }

  _authorizationEvent(AuthorizationEvent event, Emitter emit) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final userToken = prefs.getString("token");
    if (userToken != null) {
      final isExpired = await _checkExpiredToken(userToken);
      if (isExpired == true) {
        _removeUserToken();
        emit(UnAuthorizedState());
      } else {
        emit(IsAuthorizedState());
      }
    } else {
      emit(UnAuthorizedState());
    }
  }

  _authLoginEvent(AuthLoginEvent event, Emitter emit) async {
    emit(AuthLoadingState());
    try {
      await repository.auth.login(event.username, event.password);
      if (repository.auth.token != "") {
        _saveUserToken(repository.auth.token);
        emit(AuthLoginSuccessState());
      } else {
        emit(AuthLoginErrorState(repository.auth.error));
      }
    } catch (error) {
      throw Exception(error);
    }
  }


  _authLogoutEvent(AuthLogoutEvent event, Emitter emit) async {
    emit(AuthLoadingState());
    try {
      _removeUserToken();
      emit(AuthLogoutSuccessState());
    } catch (error) {
      emit(AuthLogoutErrorState());
    }
  }

  ///Function for save token after success login
  _saveUserToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userToken = repository.auth.decodedJWT(token);
    await prefs.setString("token", token);
    await prefs.setString("role", userToken["role"]);
    await prefs.setString("username", userToken["username"]);
  }

  ///Function for remove token user
  _removeUserToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  ///Function for check token is expired or not
  _checkExpiredToken(String token) async {
    final DateTime dateNow = DateTime.now();
    final DateTime jwtExp = JwtDecoder.getExpirationDate(token);
    final bool isExpired = jwtExp.isBefore(dateNow);
    return isExpired;
  }
}
