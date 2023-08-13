class AbsenceNew {
  String? id_et;
  String? code_module;
  String? code_cl;
  String? annee_deb;
  int? num_seance;
  DateTime? date_seance;
  String? id_ens;
  DateTime? date_saisie;
  String? utilisateur;
  int? semestre;
  String? justification;
  String? code_justif;
  String? lib_justif;
  String? a_convoquer;
  String? observation;
  int? new_semestre;

  AbsenceNew({
    this.id_et,
    this.code_module,
    this.code_cl,
    this.annee_deb,
    this.num_seance,
    this.date_seance,
    this.id_ens,
    this.date_saisie,
    this.utilisateur,
    this.semestre,
    this.justification,
    this.code_justif,
    this.lib_justif,
    this.a_convoquer,
    this.observation,
    this.new_semestre,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_et': id_et,
      'code_module': code_module,
      'code_cl': code_cl,
      'annee_deb': annee_deb,
      'num_seance': num_seance,
      'date_seance': date_seance,
      'id_ens': id_ens,
      'date_saisie': date_saisie,
      'utilisateur': utilisateur,
      'semestre': semestre,
      'justification': justification,
      'code_justif': code_justif,
      'lib_justif': lib_justif,
      'a_convoquer': a_convoquer,
      'observation': observation,
      'new_semestre': new_semestre,
    };
  }

  factory AbsenceNew.fromJson(dynamic json) {
    return AbsenceNew(
      id_et: json['id_et'],
      code_module: json['code_module'],
      code_cl: json['code_cl'],
      annee_deb: json['annee_deb'],
      num_seance: json['num_seance'],
      date_seance:
          json['date_seance'] != null ? DateTime.tryParse('date_seance') : null,
      id_ens: json['id_ens'],
      date_saisie: json['date_saisie'],
      utilisateur: json['utilisateur'],
      semestre: json['semstre'],
      justification: json['justification'],
      code_justif: json['code_justif'],
      lib_justif: json['lib_justif'],
      a_convoquer: json['a_convoquer'],
      observation: json['observation'],
      new_semestre: json['new_semestre'],
    );
  }
}
