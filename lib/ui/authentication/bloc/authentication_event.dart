part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final email;
  final password;
  final role;
  LoginEvent(this.email, this.password, this.role);
}

class RegistreEvent extends AuthenticationEvent {
  final email;
  final password;
  final role;
  

  RegistreEvent(this.email, this.password,this.role);
}
