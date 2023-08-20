part of 'absence_bloc.dart';

abstract class AbsenceEvent extends Equatable {
  const AbsenceEvent();

  @override
  List<Object> get props => [];
}

class GetAbsenceList extends AbsenceEvent {}

class AddReclamationAbsenceEvent extends AbsenceEvent {
  final description;
  final module;
  final etudiant;

  AddReclamationAbsenceEvent(this.description, this.module, this.etudiant);
}

class GetAbsenceByEtudiant extends AbsenceEvent {
  final String? absenceId;
  const GetAbsenceByEtudiant({required this.absenceId});
}

class GetAbsenceByEnseignant extends AbsenceEvent {
  final String? idEns;
  const GetAbsenceByEnseignant({required this.idEns});
}

class GetClassByEnseignant extends AbsenceEvent {
  final String? idEns;
  const GetClassByEnseignant({required this.idEns});
}

class GetListEtudiant extends AbsenceEvent {
  final String? code_cl;
  const GetListEtudiant({required this.code_cl});
}
