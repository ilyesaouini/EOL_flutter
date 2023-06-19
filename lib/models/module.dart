class Module{
  String? id_module;
  String? nom;
  String? credit;
  String? enseignant;

  Module({
    this.id_module,
    this.nom,
    this.credit,
    this.enseignant,
  });
  Module.fromJson(dynamic json) {
    id_module = json['id_module'];
    nom = json['nom'];
    credit = json['credit'];
    enseignant = json['enseignant'];
  }
}