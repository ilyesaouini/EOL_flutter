part of 'account_bloc.dart';

@immutable
abstract class AccountState {}

class AccountInitial extends AccountState {}



class RegistreSuccesState extends AccountState {
  final User user;
  RegistreSuccesState(this.user);
}


class OnDrawerIemSelectedState extends AccountState {

  final int selectedPosition;
  OnDrawerIemSelectedState({required this.selectedPosition});
}

class DummyState extends AccountState {}
