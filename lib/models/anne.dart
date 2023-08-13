class Annee {
  String? id_annee;
  String? description;

  Annee({
    this.id_annee,
    this.description,
  });
  Annee.fromJson(dynamic json) {
    id_annee = json['id_annee'];
    description = json['description'];
  }
}
