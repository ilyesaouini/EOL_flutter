
class NoteNew {
  String? code_module;
  String? num_panier;
  String? code_cl;
  String? annee_deb;
  String? annee_fin;
  String? id_et;
  String? type_note;
  String? nature_note;
  num? taux_note;
  String? observation;
  DateTime? date_deroulement;
  num? semestre;
  String? id_ens;
  num? nbr_heure;
  String? type_session;
  num? note_exam;
  num? note_cc;
  num? note_tp;
  num? note_ratrap;
  String? absent;
  String? absent_tp;
  String? absent_exam;
  String? absent_cc;
  String? utilisateur;
  num? numpromotioncs;
  String? niv_acquis_anglais;
  num? niveau_acquis;
  num? note_orale;
  num? note_ecrit;
  String? dispense;
  String? absent_orale;
  String? absent_ecrit;
  String? niveau_actuel;
  num? note_cc_lang;
  num? note_orale_lang;
  num? note_ecrit_lang;
  num? taux_cc_lang;
  num? taux_orale_lang;
  DateTime? date_saisie;
  DateTime? date_last_modif;
  num? note_esb_01;
  num? note_esb_02;
  num? adresse_ip;
  num? nom_machine;
  num? note_ds1;
  num? note_ds2;
  num? note_ds3;
  num? note_ds4;
  num? note_ds5;

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

  factory NoteNew.fromJson(dynamic json) {
    return NoteNew(
      code_module: json['code_module'],
      num_panier: json['num_panier'],
      code_cl: json['code_cl'],
      annee_deb: json['annee_deb'],
      annee_fin: json['annee_fin'],
      id_et: json['id_et'],
      type_note: json['type_note'],
      nature_note: json['nature_note'],
      taux_note: json['taux_note'],
      observation: json['observation'],
      date_deroulement: json['date_deroulement'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date_deroulement'])
          : null,
      semestre: json['semestre'],
      id_ens: json['id_ens'],
      nbr_heure: json['nbr_heure'],
      type_session: json['type_session'],
      note_exam: json['note_exam'],
      note_cc: json['note_cc'],
      note_tp: json['note_tp'],
      // note_ratrap: json['note_ratrap'],
      absent: json['absent'],
      absent_tp: json['absent_tp'],
      absent_exam: json['absent_exam'],
      absent_cc: json['absent_cc'],
      utilisateur: json['utilisateur'],
      numpromotioncs: json['numpromotioncs'],
      niv_acquis_anglais: json['niv_acquis_anglais'],
      niveau_acquis: json['niveau_acquis'],
      note_orale: json['note_orale'],
      note_ecrit: json['note_ecrit'],
      dispense: json['dispense'],
      absent_orale: json['absent_orale'],
      absent_ecrit: json['absent_ecrit'],
      niveau_actuel: json['niveau_actuel'],
      note_cc_lang: json['note_cc_lang'],
      note_orale_lang: json['note_orale_lang'],
      note_ecrit_lang: json['note_ecrit_lang'],
      taux_cc_lang: json['taux_cc_lang'],
      taux_orale_lang: json['taux_orale_lang'],
      date_saisie: json['date_saisie'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date_saisie'])
          : null,
      date_last_modif: json['date_last_modif'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['date_last_modif'])
          : null,
      note_esb_01: json['note_esb_01'],
      note_esb_02: json['note_esb_02'],
      adresse_ip: json['adresse_ip'],
      nom_machine: json['nom_machine'],
      note_ds1: json['note_ds1'],
      note_ds2: json['note_ds2'],
      note_ds3: json['note_ds3'],
      note_ds4: json['note_ds4'],
      note_ds5: json['note_ds5'],
    );
  }
}
