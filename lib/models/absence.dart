import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return {
      'id_absence': id_absence,
      'date_absnece': date_absence,
      'module': module,
      'etudiant': etudiant,
    };
  }


  factory Absence.fromJson(dynamic json) {
    return Absence(
      id_absence: json['id_absence'],
      date_absence: json['date_absence'],
      module: json['module'],
      etudiant: json['etudiant'],
    );
  }
}
