class Reclamation {
  int? id_reclamation;
  String? description;
  String? reponse;
  String? module;
  String? etudiant;
  String? enseignant;
  String? reclamation;
  String? status;

  Reclamation({
    this.id_reclamation,
    this.description,
    this.reponse,
    this.module,
    this.etudiant,
    this.enseignant,
    this.reclamation,
    this.status,
  });

  Reclamation.fromJson(dynamic json) {
    id_reclamation =
        json['id_reclamtion'] != null ? int.tryParse('id_reclamation') : null;
    description = json['description'];
    reponse = json['reponse'];
    module = json['module'];
    etudiant = json['etudiant'];
    enseignant = json['enseignant'];
    reclamation = json['reclamation'];
    status = json['status'];
  }
}
