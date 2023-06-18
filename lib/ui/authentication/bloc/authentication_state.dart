part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginErrorState extends AuthenticationState {}

class LoginSuccesState extends AuthenticationState {
  final SharedPreferences sharedPreferences;
  LoginSuccesState(this.sharedPreferences);
}

class RegistreSuccesState extends AuthenticationState {
  final SharedPreferences prefs;
  RegistreSuccesState(this.prefs);
}

class RegistreErrorState extends AuthenticationState {}
