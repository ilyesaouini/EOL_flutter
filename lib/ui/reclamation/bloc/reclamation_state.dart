part of 'reclamation_bloc.dart';

@immutable
abstract class ReclamationState extends Equatable {
  const ReclamationState();

  @override
  List<Object> get props => [];
}

class ReclamationInitial extends ReclamationState {}

class ReclamationLoading extends ReclamationState {}

class ReclamationLoaded extends ReclamationState {
  final List<Reclamation> responseList;
  const ReclamationLoaded(this.responseList);
}

class ReclamationError extends ReclamationState {
  final String? message;
  const ReclamationError(this.message);
}

class AddReclamationSuccesState extends ReclamationState {}

class AddReclamationErrorState extends ReclamationState {}

class ReponseReclamationSuccesState extends ReclamationState {}

class ReponseReclamationErrorState extends ReclamationState {}

class ListReclamationSuccessState extends ReclamationState {}

class ListReclamationErrorState extends ReclamationState {}
