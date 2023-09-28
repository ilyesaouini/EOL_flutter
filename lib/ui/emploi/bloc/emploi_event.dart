part of 'emploi_bloc.dart';

@immutable
abstract class EmploiEvent {}
class AddEmploi extends EmploiEvent{
  final File file;
  AddEmploi(this.file);
}
class GetEmploi extends EmploiEvent{
  
}