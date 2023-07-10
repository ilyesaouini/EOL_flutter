part of 'absence_bloc.dart';

abstract class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

class GetAbsenceList extends AbsenceEvent {}

class ReclamationEvent extends AbsenceEvent {
  final description;
  final module;
  final etudiant;
 

  ReclamationEvent(this.description,
  this.module,
  this.etudiant);
}
class GetAbsenceById extends AbsenceEvent{
  final String? absenceId;
  const GetAbsenceById({ required this.absenceId});
}
