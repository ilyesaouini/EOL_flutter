class Absence {
  int? id_absence;
  String? date_absence;
  String? module;

  String? etudiant;

  Absence({
    this.id_absence,
    this.date_absence,
    this.module,
    this.etudiant,
  });

  Absence.fromJson(Map<String, dynamic> json) {
    id_absence = json['id_absence'];
    date_absence = json['date_absence'];
    module = json['module'];
    etudiant = json['etudiant'];
  }
  Absence.withError(String errorMessage) {
   String error = errorMessage;
  }
}
