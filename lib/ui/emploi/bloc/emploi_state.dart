part of 'emploi_bloc.dart';

@immutable
abstract class EmploiState extends Equatable {
  const EmploiState();

  @override
  List<Object> get props => [];
}

class EmploiInitial extends EmploiState {}

class EmploiLoading extends EmploiState {}

class EmploiLoaded extends EmploiState {
  final List<Emploi> emploi;
  const EmploiLoaded(this.emploi);
}

class EmploiError extends EmploiState {
  final String? message;
  EmploiError(this.message);
}
