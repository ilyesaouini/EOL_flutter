part of 'absence_bloc.dart';

abstract class AbsenceState extends Equatable {
  const AbsenceState();

  @override
  List<Object> get props => [];
}

class AbsenceInitial extends AbsenceState {}

class AbsenceLoading extends AbsenceState {}

class AbsenceLoaded extends AbsenceState {
  final List<AbsenceNew> responseList;
  const AbsenceLoaded(this.responseList);
}

class AbsenceError extends AbsenceState {
  final String? message;
  const AbsenceError(this.message);
}

class ReclamationSuccesState extends AbsenceState {}

class ReclamationErrorState extends AbsenceState {}

class AbsenceDetailsLoaded extends AbsenceState {
  final Absence absence;
  const AbsenceDetailsLoaded(this.absence);
}

class AbsenceEtudiantSuccesState extends AbsenceState {}
class ClassLoading extends AbsenceState {}

class ClassLoaded extends AbsenceState {
  final List<Plan_Class_Session> responseList;
  const ClassLoaded(this.responseList);
}

class ClassError extends AbsenceState {
  final String? message;
  const ClassError(this.message);
}