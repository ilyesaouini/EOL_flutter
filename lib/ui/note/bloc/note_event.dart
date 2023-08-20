part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetNoteList extends NoteEvent {}

class AddReclamationNoteEvent extends NoteEvent {
  final description;
  final module;
  final etudiant;
  AddReclamationNoteEvent(this.description, this.module, this.etudiant);
}

class GetEtudiantNotes extends NoteEvent {
  final String? id_et;
  const GetEtudiantNotes({required this.id_et});
}

class GetPanierList extends NoteEvent{
  final String id_ens;
  const GetPanierList ({required this.id_ens});
}