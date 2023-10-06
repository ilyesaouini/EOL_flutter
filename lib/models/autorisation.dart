class Autorisation {
  num? etat_note;
  num? etat_resultat;
  bool ischeckednote= false;
  bool ischeckedresultat= false;
  Autorisation({
    this.etat_note,
    this.etat_resultat,
  });

  factory Autorisation.fromJson(dynamic json) {
    return Autorisation(
        etat_note: json['etat_note'], etat_resultat: json['etat_resultat']);
  }
}
