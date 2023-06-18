part of 'absence_bloc.dart';

abstract class AbsenceState extends Equatable {
  const AbsenceState();

  @override
  List<Object> get props => [];
}

class AbsenceInitial extends AbsenceState {}

class AbsenceLoading extends AbsenceState {}

class AbsenceLoaded extends AbsenceState {
  final List<dynamic> absenceModel;
  const AbsenceLoaded(this.absenceModel);
}

class AbsenceError extends AbsenceState {
  final String? message;
  const AbsenceError(this.message);
}
