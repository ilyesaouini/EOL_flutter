class Annee {
  String? id_anne;
  String? description;

  Annee({
    this.id_anne,
    this.description,
  });
  Annee.fromJson(Map<String, dynamic> json) {
    id_anne = json['id_anne'];
    description = json['description'];
  }
}
