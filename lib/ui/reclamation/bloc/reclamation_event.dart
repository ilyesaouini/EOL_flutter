part of 'reclamation_bloc.dart';

@immutable
abstract class ReclamationEvent {
  const ReclamationEvent();

  @override
  List<Object> get props => [];
}

class GetReclamationList extends ReclamationEvent {}

class AddReclamationSimpleEvent extends ReclamationEvent {
  final id;
  final description;
  AddReclamationSimpleEvent(this.id, this.description);
}

class ReponseReclamationEvent extends ReclamationEvent {
  final id;
  final reponse;
  final status;
  ReponseReclamationEvent(this.id, this.reponse,this.status);
}
