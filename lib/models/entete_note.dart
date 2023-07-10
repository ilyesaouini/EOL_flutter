import 'dart:convert';

class Entete_Note {
   String? code_module;
   String? classe;
   String? enseignant;
   String? etat;
   String? annee;
   String? semestre;

  Entete_Note({
     this.code_module,
     this.classe,
     this.enseignant,
     this.etat,
     this.annee,
     this.semestre,
  });

  Map<String, dynamic> toMap() {
    return {
      'code_module': code_module,
      'classe': classe,
      'enseignant': enseignant,
      'etat': etat,
      'annee': annee,
      'semestre': semestre,
    };
  }

  factory Entete_Note.fromJson(dynamic json){

  return Entete_Note(
      code_module: json['code_module'],
      classe: json['classe'] ,
      enseignant: json['enseignant'],
      etat: json['etat'],
      annee: json['annee'],
      semestre: json['semestre'],
    );
}
}
