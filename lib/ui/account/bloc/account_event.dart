part of 'account_bloc.dart';

@immutable
abstract class AccountEvent {}

class UploadImageEvent extends AccountEvent {
  final id;
  final image;
   UploadImageEvent(this.id,this.image);
}
