import 'dart:ffi';

class Note {
  int? code_note;
  String? module;
  String? etudiant;
  double? note_cc;
  double? note_tp;
  double? note_examen;
  String? abs_cc;
  String? abs_tp;
  String? abs_examen;

  Note({
    this.code_note,
    this.module,
    this.etudiant,
    this.note_cc,
    this.note_tp,
    this.note_examen,
    this.abs_cc,
    this.abs_tp,
    this.abs_examen,
  });
  factory Note.fromJson(dynamic json) {
    return Note(
      code_note: json['code_note'],
      module: json['module'],
      etudiant: json['etudiant'],
      note_cc: json['note_cc'],
      note_tp: json['note_tp'],
      note_examen:json['note_examen'],
      abs_cc: json['abs_cc'],
      abs_tp: json['abs_tp'],
      abs_examen: json['abs_examen'],
    );
  }
}
