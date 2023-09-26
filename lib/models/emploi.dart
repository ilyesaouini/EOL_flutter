class Emploi {
  int? id_emploi;
  String? emploi;
  String? type;
  String? date_ajout;
  String? path;
  String? name;

  Emploi(
      {this.id_emploi,
      this.emploi,
      this.type,
      this.path,
      this.date_ajout,
      this.name});
  Emploi.fromJson(dynamic json) {
    id_emploi = json['id_emploi'];
    emploi = json['emploi'];
    path = json['path'];
    type = json['type'];
    date_ajout = json['date_ajout'];
    name = json['name'];
  }
}
