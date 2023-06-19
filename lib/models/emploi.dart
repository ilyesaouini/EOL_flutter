class Emploi {
  String? id_emploi;
  String? description;
  
  
  
  Emploi({
    this.id_emploi,
    this.description,
    
  });
  Emploi.fromJson(dynamic json) {
    id_emploi = json['id_emploi'];
     description = json['description'];
  }
}