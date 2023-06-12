import 'dart:ffi';

class Note {
  int? id_note;
  Float? note;
  String? module;
  String? etudiant;

  Note({
    this.id_note,
    this.note,
    this.module,
    this.etudiant,
  });
  Note.fromJson(Map<String, dynamic> json) {
    id_note = json['id_note'];
    note = json['note'];
    module = json['module'];
    etudiant = json['etudiant'];
  }
}
