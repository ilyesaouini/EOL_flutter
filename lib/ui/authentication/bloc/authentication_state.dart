part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class LoginErrorState extends AuthenticationState {}

class LoginSuccesState extends AuthenticationState {
  final User user;
  LoginSuccesState(this.user);
}

class RegistreSuccesState extends AuthenticationState {
  final User user;
  RegistreSuccesState(this.user);
}

class RegistreErrorState extends AuthenticationState {}
