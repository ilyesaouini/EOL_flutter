import 'dart:convert';
import 'dart:ffi';

class enete_note_new {
  String? code_module;
  String? num_panier;
  String? code_cl;
  String? annee_deb;
  String? annee_fin;
  String? id_ens;
  String? type_session;
  String? nature_note;
  String? observation;
  DateTime? date_deroulement;
  int? semestre;
  int? nb_heure;
  String? confirmation;
  DateTime? date_saisie;
  DateTime? date_confirmation;
  Double? taux_exam;
  Double? taux_cc;
  Double? taux_tp;
  String? existe_note_cc;
  String? existe_note_tp;
  Double? coef;
  DateTime? date_ratrap;
  String? user_name;
  String? conf_rattrapage;
  DateTime? date_conf_ratt;
  String? user_confirm;
  DateTime? date_last_modif;
  DateTime? user_last_modif;
  String? tatouage_ens;
  String? confirm_new;
  int? numpromotioncs;
  Double? taux_ecrit_lang;
  Double? taux_oral_lang;
  Double? taux_cc_lang;
  String? module_fantome;
  int? nbre_ds;
  String? existe_colle;
  String? designation_module;
  enete_note_new({
    this.code_module,
    this.num_panier,
    this.code_cl,
    this.annee_deb,
    this.annee_fin,
    this.id_ens,
    this.type_session,
    this.nature_note,
    this.observation,
    this.date_deroulement,
    this.semestre,
    this.nb_heure,
    this.confirmation,
    this.date_saisie,
    this.date_confirmation,
    this.taux_exam,
    this.taux_cc,
    this.taux_tp,
    this.existe_note_cc,
    this.existe_note_tp,
    this.coef,
    this.date_ratrap,
    this.user_name,
    this.conf_rattrapage,
    this.date_conf_ratt,
    this.user_confirm,
    this.date_last_modif,
    this.user_last_modif,
    this.tatouage_ens,
    this.confirm_new,
    this.numpromotioncs,
    this.taux_ecrit_lang,
    this.taux_oral_lang,
    this.taux_cc_lang,
    this.module_fantome,
    this.nbre_ds,
    this.existe_colle,
    this.designation_module,
  });

  Map<String, dynamic> toMap() {
    return {
      'code_module': code_module,
      'num_panier': num_panier,
      'code_cl': code_cl,
      'annee_deb': annee_deb,
      'annee_fin': annee_fin,
      'id_ens': id_ens,
      'type_session': type_session,
      'nature_note': nature_note,
      'observation': observation,
      'date_deroulement': date_deroulement?.millisecondsSinceEpoch,
      'semestre': semestre,
      'nb_heure': nb_heure,
      'confirmation': confirmation,
      'date_saisie': date_saisie?.millisecondsSinceEpoch,
      'date_confirmation': date_confirmation?.millisecondsSinceEpoch,
      'taux_exam': taux_exam,
      'taux_cc': taux_cc,
      'taux_tp': taux_tp,
      'existe_note_cc': existe_note_cc,
      'existe_note_tp': existe_note_tp,
      'coef': coef,
      'date_ratrap': date_ratrap?.millisecondsSinceEpoch,
      'user_name': user_name,
      'conf_rattrapage': conf_rattrapage,
      'date_conf_ratt': date_conf_ratt?.millisecondsSinceEpoch,
      'user_confirm': user_confirm,
      'date_last_modif': date_last_modif?.millisecondsSinceEpoch,
      'user_last_modif': user_last_modif?.millisecondsSinceEpoch,
      'tatouage_ens': tatouage_ens,
      'confirm_new': confirm_new,
      'numpromotioncs': numpromotioncs,
      'taux_ecrit_lang': taux_ecrit_lang,
      'taux_oral_lang': taux_oral_lang,
      'taux_cc_lang': taux_cc_lang,
      'module_fantome': module_fantome,
      'nbre_ds': nbre_ds,
      'existe_colle': existe_colle,
      'designation_module': designation_module,
    };
  }

  factory enete_note_new.fromMap(Map<String, dynamic> map) {
    return enete_note_new(
      code_module: map['code_module'],
      num_panier: map['num_panier'],
      code_cl: map['code_cl'],
      annee_deb: map['annee_deb'],
      annee_fin: map['annee_fin'],
      id_ens: map['id_ens'],
      type_session: map['type_session'],
      nature_note: map['nature_note'],
      observation: map['observation'],
      date_deroulement: map['date_deroulement'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_deroulement'])
          : null,
      semestre: map['semestre']?.toInt(),
      nb_heure: map['nb_heure']?.toInt(),
      confirmation: map['confirmation'],
      date_saisie: map['date_saisie'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_saisie'])
          : null,
      date_confirmation: map['date_confirmation'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_confirmation'])
          : null,
      taux_exam: map['taux_exam'],
      taux_cc: map['taux_cc'],
      taux_tp: map['taux_tp'],
      existe_note_cc: map['existe_note_cc'],
      existe_note_tp: map['existe_note_tp'],
      coef: map['coef'],
      date_ratrap: map['date_ratrap'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_ratrap'])
          : null,
      user_name: map['user_name'],
      conf_rattrapage: map['conf_rattrapage'],
      date_conf_ratt: map['date_conf_ratt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_conf_ratt'])
          : null,
      user_confirm: map['user_confirm'],
      date_last_modif: map['date_last_modif'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['date_last_modif'])
          : null,
      user_last_modif: map['user_last_modif'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['user_last_modif'])
          : null,
      tatouage_ens: map['tatouage_ens'],
      confirm_new: map['confirm_new'],
      numpromotioncs: map['numpromotioncs']?.toInt(),
      taux_ecrit_lang: map['taux_ecrit_lang'],
      taux_oral_lang: map['taux_oral_lang'],
      taux_cc_lang: map['taux_cc_lang'],
      module_fantome: map['module_fantome'],
      nbre_ds: map['nbre_ds']?.toInt(),
      existe_colle: map['existe_colle'],
      designation_module: map['designation_module'],
    );
  }

  String toJson() => json.encode(toMap());

  factory enete_note_new.fromJson(String source) =>
      enete_note_new.fromMap(json.decode(source));
}
