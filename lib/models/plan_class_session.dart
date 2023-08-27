import 'dart:ffi';

class Plan_Class_Session {
  String? code_module;
  String? num_panier;
  String? code_cl;
  String? annee_deb;
  String? annee_fin;
  String? description;
  double? nb_heures;
  int? coef;

  double? num_semestre;
  double? num_periode;
  String? date_debut;
  String? date_fin;
  String? date_examen;
  double? nbr_horaire_realises;
  String? acomptabiliseur;
  String? id_ens;
  String? id_ens2;
  double? nbr_heures_ens;
  double? nbr_heures_ens2;
  String? surveillant;
  String? heure_exam;
  String? salle_exam;
  String? surveillant2;
  String? salle_exam2;
  double? periode;
  int? numpromotioncs;
  int? ap_cs;
  double? charge_p1;
  double? charge_p2;
  double? charge_ens1_p1;
  double? charge_ens1_p2;
  double? charge_ens2_p1;
  double? charge_ens2_p2;
  String? seance_unique;
  String? id_ens3;
  String? id_ens4;
  String? id_ens5;
  double? charge_ens3_p1;
  double? charge_ens3_p2;
  double? charge_ens4_p1;
  double? charge_ens4_p2;
  double? charge_ens5_p1;
  double? charge_ens5_p2;
  String? code_ue;
  int? nbr_etcs;
  String? type_epreuve;
  String? salle;
  String? type_ens;
  String? type_epreuve_sr;
  String? date_rattrapage;
  String? heure_rat;
  String? salle1_ratt;
  String? salle2_ratt;
  DateTime? date_rat;
  DateTime? date_creation;
  DateTime? date_last_maj;
  String? designation_new;
  double? chargep1add;
  double? chargep2add;
  int? code_plan;
  double? nbheuradd;
  String? calcul_rat;
  String? existe_cc;
  String? existe_tp;

  String? heur_fin_sp;
  String? heure_fin_sr;
  String? ue_fantome;
  String? utilisateur;
  String? actif;
  int? contact;
  String? id_ens6;
  double? charge_ens6_p1;
  double? charge_ens6_p2;
  String? observation;
  double? coef_mine_pont;

  Plan_Class_Session({
    this.code_module,
    this.num_panier,
    this.code_cl,
    this.annee_deb,
    this.annee_fin,
    this.description,
    this.nb_heures,
    this.coef,
    this.num_semestre,
    this.num_periode,
    this.date_debut,
    this.date_fin,
    this.date_examen,
    this.nbr_horaire_realises,
    this.acomptabiliseur,
    this.id_ens,
    this.id_ens2,
    this.nbr_heures_ens,
    this.nbr_heures_ens2,
    this.surveillant,
    this.heure_exam,
    this.salle_exam,
    this.surveillant2,
    this.salle_exam2,
    this.periode,
    this.numpromotioncs,
    this.ap_cs,
    this.charge_p1,
    this.charge_p2,
    this.charge_ens1_p1,
    this.charge_ens1_p2,
    this.charge_ens2_p1,
    this.charge_ens2_p2,
    this.seance_unique,
    this.id_ens3,
    this.id_ens4,
    this.id_ens5,
    this.charge_ens3_p1,
    this.charge_ens3_p2,
    this.charge_ens4_p1,
    this.charge_ens4_p2,
    this.charge_ens5_p1,
    this.charge_ens5_p2,
    this.code_ue,
    this.nbr_etcs,
    this.type_epreuve,
    this.salle,
    this.type_ens,
    this.type_epreuve_sr,
    this.date_rattrapage,
    this.heure_rat,
    this.salle1_ratt,
    this.salle2_ratt,
    this.date_rat,
    this.date_creation,
    this.date_last_maj,
    this.designation_new,
    this.chargep1add,
    this.chargep2add,
    this.code_plan,
    this.nbheuradd,
    this.calcul_rat,
    this.existe_cc,
    this.existe_tp,
    this.heur_fin_sp,
    this.heure_fin_sr,
    this.ue_fantome,
    this.utilisateur,
    this.actif,
    this.contact,
    this.id_ens6,
    this.charge_ens6_p1,
    this.charge_ens6_p2,
    this.observation,
    this.coef_mine_pont,
  });

  factory Plan_Class_Session.fromJson(dynamic json) {
    return Plan_Class_Session(
      code_module: json['code_module'],
      num_panier: json['num_panier'],
      code_cl: json['code_cl'],
      annee_deb: json['annee_deb'],
      annee_fin: json['annee_fin'],
      description: json['description'],
      nb_heures: json['nb_heures'],
      coef: json['coef'],
      //num_semestre: json['num_semestre'],
      num_periode: json['num_periode'],
      date_debut: json['date_debut'],
      date_fin: json['date_fin'],
      date_examen: json['date_examen'],
      nbr_horaire_realises: json['nbr_horaire_realises'],
      acomptabiliseur: json['acomptabiliseur'],
      id_ens: json['id_ens'],
      id_ens2: json['id_ens2'],
      nbr_heures_ens: json['nbr_heures_ens'],
      nbr_heures_ens2: json['nbr_heures_ens2'],
      surveillant: json['surveillant'],
      heure_exam: json['heure_exam'],
      salle_exam: json['salle_exam'],
      surveillant2: json['surveillant2'],
      salle_exam2: json['salle_exam2'],
      periode: json['periode'],
      numpromotioncs: json['numpromotioncs'],
      ap_cs: json['ap_cs'],
      charge_p1: json['charge_p1'],
      charge_p2: json['charge_p2'],
      charge_ens1_p1: json['charge_ens1_p1'],
      charge_ens1_p2: json['charge_ens1_p2'],
      charge_ens2_p1: json['charge_ens2_p1'],
      charge_ens2_p2: json['charge_ens2_p2'],
      seance_unique: json['seance_unique'],
      id_ens3: json['id_ens3'],
      id_ens4: json['id_ens4'],
      id_ens5: json['id_ens5'],
      charge_ens3_p1: json['charge_ens3_p1'],
      charge_ens3_p2: json['charge_ens3_p2'],
      charge_ens4_p1: json['charge_ens4_p1'],
      charge_ens4_p2: json['charge_ens4_p2'],
      charge_ens5_p1: json['charge_ens5_p1'],
      charge_ens5_p2: json['charge_ens5_p2'],
      code_ue: json['code_ue'],
      nbr_etcs: json['nbr_etcs'],
      type_epreuve: json['type_epreuve'],
      salle: json['salle'],
      type_ens: json['type_ens'],
      type_epreuve_sr: json['type_epreuve_sr'],
      date_rattrapage: json['date_rattrapage'],
      heure_rat: json['heure_rat'],
      salle1_ratt: json['salle1_ratt'],
      salle2_ratt: json['salle2_ratt'],
      date_rat: json['date_rat'],
      date_creation: json['date_creation'],
      date_last_maj: json['date_last_maj'],
      designation_new: json['designation_new'],
      chargep1add: json['chargep1add'],
      chargep2add: json['chargep2add'],
      code_plan: json['code_plan'],
      nbheuradd: json['nbheuradd'],
      calcul_rat: json['calcul_rat'],
      existe_cc: json['existe_cc'],
      existe_tp: json['existe_tp'],
      heur_fin_sp: json['heur_fin_sp'],
      heure_fin_sr: json['heure_fin_sr'],
      ue_fantome: json['ue_fantome'],
      utilisateur: json['utilisateur'],
      actif: json['actif'],
      contact: json['contact'],
      id_ens6: json['id_ens6'],
      charge_ens6_p1: json['charge_ens6_p1'],
      charge_ens6_p2: json['charge_ens6_p2'],
      observation: json['observation'],
      coef_mine_pont: json['coef_mine_pont'],
    );
  }
}
