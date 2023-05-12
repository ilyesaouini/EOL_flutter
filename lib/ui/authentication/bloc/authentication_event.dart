part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final email;
  final password;

  LoginEvent(this.email, this.password);
}

class RegistreEvent extends AuthenticationEvent {
  final email;
  final password;

  RegistreEvent(this.email, this.password);
}
