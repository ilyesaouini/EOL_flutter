part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}



class RegistreSuccesState extends AccountState {
  final User user;
  RegistreSuccesState(this.user);
}
