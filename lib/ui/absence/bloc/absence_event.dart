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
  final enseignant;

  AddReclamationAbsenceEvent(
      this.description, this.module, this.etudiant, this.enseignant);
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

class AddAbsence extends AbsenceEvent {
  final String? id_et;
  final String? code_cl;
  final String? code_module;
  final String? annee_deb;
  final int? num_seance;
  final String? date_seance;
  final String? date_saisie;
  final String? id_ens;

  AddAbsence(
    this.id_et,
    this.code_cl,
    this.code_module,
    this.annee_deb,
    this.num_seance,
    this.date_seance,
    this.date_saisie,
    this.id_ens,
  );
}

class AbsenceList extends AbsenceEvent {
  final String? code_cl;
  final String? code_module;
  final String? id_ens;
  AbsenceList(this.code_cl, this.code_module, this.id_ens);
}
