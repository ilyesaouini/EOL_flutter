

class Inscription {
   String? etudiant;
   String? niveau;
   String? code_classe;
   String? annee;
   String? moy_generale;
   String? moy_semestre1;
   String? decision;

  Inscription({
     this.etudiant,
     this.niveau,
     this.code_classe,
     
     this.annee,
     this.moy_generale,
     this.moy_semestre1,
     this.decision,
  });

  Map<String, dynamic> toMap() {
    return {
      'etudiant': etudiant,
      'niveau': niveau,
      'code_classe': code_classe,
      'annee': annee,
      'moy_generale': moy_generale,
      'moy_semestre1': moy_semestre1,
      'decision': decision,
    };
  }

  factory Inscription.fromJson(dynamic json){

  return Inscription(
      etudiant: json['etudiant'],
      niveau: json['niveau'] ,
      code_classe: json['code_classe'],
      annee: json['annee'],
      moy_generale: json['moy_generale'],
      moy_semestre1: json['moy_semestre1'],
      decision: json['decision'],
    );
}
}
