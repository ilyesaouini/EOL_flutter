part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoading extends NoteState {}

class NoteLoaded extends NoteState {
  final List<NoteNew> responseList;
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


class NotesEtduiantLoading extends NoteState{}
class NoteEtudiantLoaded extends NoteState {
  final List<NoteNew> responseList;
  const NoteEtudiantLoaded(this.responseList);
}


class PanierLoading extends NoteState{}

class PanierLoaded extends NoteState{
  final List<Plan_Class_Session> responseList;
  const PanierLoaded(this.responseList);

}
class PanierErrorState extends NoteState{
  final String? message;
  const PanierErrorState(this.message);
}