part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class UpladImageEvent extends AccountEvent {
  final id;
  final image;
   UpladImageEvent(this.id,this.image);
}
