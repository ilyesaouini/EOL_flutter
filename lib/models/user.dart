import 'dart:ffi';

class User {
  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? phone;
  String? birthdate;
  String? title;
  String? departement;
  String? image;
  User({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.phone,
    this.birthdate,
    this.title,
    this.departement,
    this.image,
  });
}
