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
/*
  factory Absence.fromMap(Map<String, dynamic> map) {
    return Absence(
      id_absence: map['id_absence']?.toInt() ?? 0,
      date_absence: map['date_absence'] ?? '',
      module: map['module'] ?? '',
      etudiant: map['etudiant'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Absence.fromJson(String source) =>
      Absence.fromMap(json.decode(source));

*/
factory Absence.fromJson(dynamic json){

  return Absence(
      id_absence: json['id_absence'],
      date_absence: json['date_absence'] ,
      module: json['module'],
      etudiant: json['etudiant'],
    );
}
}
