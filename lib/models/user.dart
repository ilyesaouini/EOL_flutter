import 'dart:ffi';

class User {
  String? id;
  String? nom_prenom;
  String? nom;
  String? prenom;
  String? email;
  String? date_de_naissance;
  String? image;
  String? tel;
  
  User({
    this.id,
    this.nom_prenom,
    this.nom,
    this.prenom,
    this.email,
    this.date_de_naissance,
    
    this.tel,
    this.image,
  });
}
