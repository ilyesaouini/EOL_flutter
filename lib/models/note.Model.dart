import 'dart:convert';
import 'dart:ffi';

class NoteNew {
  String? code_module;
  String? num_panier;
  String? code_cl;
  String? annee_deb;
  String? annee_fin;
  String? id_et;
  String? type_note;
  String? nature_note;
  int? taux_note;
  String? observation;
  DateTime? date_deroulement;
  int? semestre;
  String? id_ens;
  int? nbr_heure;
  String? type_session;
  Double? note_exam;
  Double? note_cc;
  Double? note_tp;
  Double? note_ratrap;
  String? absent;
  String? absent_tp;
  String? absent_exam;
  String? absent_cc;
  String? utilisateur;
  int? numpromotioncs;
  String? niv_acquis_anglais;
  int? niveau_acquis;
  Double? note_orale;
  Double? note_ecrit;
  String? dispense;
  String? absent_orale;
  String? absent_ecrit;
  String? niveau_actuel;
  Double? note_cc_lang;
  Double? note_orale_lang;
  Double? note_ecrit_lang;
  Double? taux_cc_lang;
  Double? taux_orale_lang;
  DateTime? date_saisie;
  DateTime? date_last_modif;
  Double? note_esb_01;
  Double? note_esb_02;
  Double? adresse_ip;
  Double? nom_machine;
  Double? note_ds1;
  Double? note_ds2;
  Double? note_ds3;
  Double? note_ds4;
  Double? note_ds5;

  NoteNew({
    this.code_module,
    this.num_panier,
    this.code_cl,
    this.annee_deb,
    this.annee_fin,
    this.id_et,
    this.type_note,
    this.nature_note,
    this.taux_note,
    this.observation,
    this.date_deroulement,
    this.semestre,
    this.id_ens,
    this.nbr_heure,
    this.type_session,
    this.note_exam,
    this.note_cc,
    this.note_tp,
    this.note_ratrap,
    this.absent,
    this.absent_tp,
    this.absent_exam,
    this.absent_cc,
    this.utilisateur,
    this.numpromotioncs,
    this.niv_acquis_anglais,
    this.niveau_acquis,
    this.note_orale,
    this.note_ecrit,
    this.dispense,
    this.absent_orale,
    this.absent_ecrit,
    this.niveau_actuel,
    this.note_cc_lang,
    this.note_orale_lang,
    this.note_ecrit_lang,
    this.taux_cc_lang,
    this.taux_orale_lang,
    this.date_saisie,
    this.date_last_modif,
    this.note_esb_01,
    this.note_esb_02,
    this.adresse_ip,
    this.nom_machine,
    this.note_ds1,
    this.note_ds2,
    this.note_ds3,
    this.note_ds4,
    this.note_ds5,
  });


  Map<String, dynamic> toMap() {
    return {
      'code_module': code_module,
      'num_panier': num_panier,
      'code_cl': code_cl,
      'annee_deb': annee_deb,
      'annee_fin': annee_fin,
      'id_et': id_et,
      'type_note': type_note,
      'nature_note': nature_note,
      'taux_note': taux_note,
      'observation': observation,
      'date_deroulement': date_deroulement?.millisecondsSinceEpoch,
      'semestre': semestre,
      'id_ens': id_ens,
      'nbr_heure': nbr_heure,
      'type_session': type_session,
      'note_exam': note_exam,
      'note_cc': note_cc,
      'note_tp': note_tp,
      'note_ratrap': note_ratrap,
      'absent': absent,
      'absent_tp': absent_tp,
      'absent_exam': absent_exam,
      'absent_cc': absent_cc,
      'utilisateur': utilisateur,
      'numpromotioncs': numpromotioncs,
      'niv_acquis_anglais': niv_acquis_anglais,
      'niveau_acquis': niveau_acquis,
      'note_orale': note_orale,
      'note_ecrit': note_ecrit,
      'dispense': dispense,
      'absent_orale': absent_orale,
      'absent_ecrit': absent_ecrit,
      'niveau_actuel': niveau_actuel,
      'note_cc_lang': note_cc_lang,
      'note_orale_lang': note_orale_lang,
      'note_ecrit_lang': note_ecrit_lang,
      'taux_cc_lang': taux_cc_lang,
      'taux_orale_lang': taux_orale_lang,
      'date_saisie': date_saisie?.millisecondsSinceEpoch,
      'date_last_modif': date_last_modif?.millisecondsSinceEpoch,
      'note_esb_01': note_esb_01,
      'note_esb_02': note_esb_02,
      'adresse_ip': adresse_ip,
      'nom_machine': nom_machine,
      'note_ds1': note_ds1,
      'note_ds2': note_ds2,
      'note_ds3': note_ds3,
      'note_ds4': note_ds4,
      'note_ds5': note_ds5,
    };
  }

  factory NoteNew.fromMap(dynamic map) {
    return NoteNew(
      code_module: map['code_module'],
      num_panier: map['num_panier'],
      code_cl: map['code_cl'],
      annee_deb: map['annee_deb'],
      annee_fin: map['annee_fin'],
      id_et: map['id_et'],
      type_note: map['type_note'],
      nature_note: map['nature_note'],
      taux_note: map['taux_note']?.toInt(),
      observation: map['observation'],
      date_deroulement: map['date_deroulement'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date_deroulement']) : null,
      semestre: map['semestre']?.toInt(),
      id_ens: map['id_ens'],
      nbr_heure: map['nbr_heure']?.toInt(),
      type_session: map['type_session'],
      note_exam: map['note_exam'] ,
      note_cc: map['note_cc'] ,
      note_tp: map['note_tp'] ,
      note_ratrap: map['note_ratrap'] ,
      absent: map['absent'],
      absent_tp: map['absent_tp'],
      absent_exam: map['absent_exam'],
      absent_cc: map['absent_cc'],
      utilisateur: map['utilisateur'],
      numpromotioncs: map['numpromotioncs']?.toInt(),
      niv_acquis_anglais: map['niv_acquis_anglais'],
      niveau_acquis: map['niveau_acquis']?.toInt(),
      note_orale: map['note_orale'] ,
      note_ecrit: map['note_ecrit'] ,
      dispense: map['dispense'],
      absent_orale: map['absent_orale'],
      absent_ecrit: map['absent_ecrit'],
      niveau_actuel: map['niveau_actuel'],
      note_cc_lang: map['note_cc_lang'] ,
      note_orale_lang: map['note_orale_lang'] ,
      note_ecrit_lang: map['note_ecrit_lang'] ,
      taux_cc_lang: map['taux_cc_lang'] ,
      taux_orale_lang: map['taux_orale_lang'] ,
      date_saisie: map['date_saisie'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date_saisie']) : null,
      date_last_modif: map['date_last_modif'] != null ? DateTime.fromMillisecondsSinceEpoch(map['date_last_modif']) : null,
      note_esb_01: map['note_esb_01'] ,
      note_esb_02: map['note_esb_02'] ,
      adresse_ip: map['adresse_ip'] !,
      nom_machine: map['nom_machine'] ,
      note_ds1: map['note_ds1'] ,
      note_ds2: map['note_ds2'] ,
      note_ds3: map['note_ds3'] ,
      note_ds4: map['note_ds4'] ,
      note_ds5: map['note_ds5'] ,
    );
  }

}
