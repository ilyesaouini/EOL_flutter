part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class GetNoteList extends NoteEvent {}

class AddReclamationNote extends NoteEvent {
  final description;
  AddReclamationNote(this.description);
}
