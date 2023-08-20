import 'dart:convert';

class User {
  String? id;
  String? nom_prenom;
  String? nom;
  String? prenom;
  String? email;
  String? date_de_naissance;
  String? image;
  String? tel;
  String? role;
  

  User({
    this.id,
    this.nom_prenom,
    this.nom,
    this.prenom,
    this.email,
    this.date_de_naissance,
    this.tel,
    this.image,
    this.role
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nom_prenom': nom_prenom,
      'nom': nom,
      'prenom': prenom,
      'email': email,
      'date_de_naissance': date_de_naissance,
      'image': image,
      'tel': tel,
      'role': role,
    };
  }

  factory User.fromJson(dynamic json) {
   return User(

      id :json['id'],
      nom_prenom: json['nom_prenom'],
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      date_de_naissance: json['date_de_naissance'],
      image: json['image'],
      tel: json['tel'],
      role: json['role']
   );
    
  }

  String toJson() => json.encode(toMap());

  
}
