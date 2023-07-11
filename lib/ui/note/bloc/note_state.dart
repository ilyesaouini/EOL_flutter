part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<Note> responseList;
  const NoteLoaded(this.responseList);
}

class NoteError extends NoteState {
  final String? message;
  const NoteError(this.message);
}

class AddReclamationSuccessState extends NoteState {}

class ReclamationErrorState extends NoteState {
  final String? message;
  const ReclamationErrorState(this.message);
}
