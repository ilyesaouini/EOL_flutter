import 'dart:convert';

class Absence {
  final int id_absence;
  final String date_absence;
  final String module;

  final String etudiant;

  Absence({
    required this.id_absence,
    required this.date_absence,
    required this.module,
    required this.etudiant,
  });

  Map<String, dynamic> toMap() {
    return {
      'id_absence': id_absence,
      'date_absnece': date_absence,
      'module': module,
      'etudiant': etudiant,
    };
  }

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
}
