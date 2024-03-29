part of 'resultat_bloc.dart';

abstract class ResultatState extends Equatable {
  const ResultatState();

  @override
  List<Object> get props => [];
}

class ResultatInitial extends ResultatState {}

class ResultatLoading extends ResultatState {}

class ResultatLoaded extends ResultatState {
  final List<Inscription> responseList;
  const ResultatLoaded(this.responseList);
}

class ResultatError extends ResultatState {
  final String? message;
  const ResultatError(this.message);
}

class AUtorisationLoading extends ResultatState {}

class AutorisationLoaded extends ResultatState {
  final List<Autorisation> responseList;
  const AutorisationLoaded(this.responseList);
}

class AutorisationError extends ResultatState {
  final String? message;
  const AutorisationError({required this.message});
}

class AutorisationSuccesState extends ResultatState {}

class AutorisationErrorState extends ResultatState {}