class Classe {
  String? id_classe;
  String? description;

  Classe({
    this.id_classe,
    this.description,
  });
  Classe.fromJson(Map<String, dynamic> json) {
    id_classe = json['id_classe'];
     description = json['description'];
  }
}
