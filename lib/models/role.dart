class Role {
  String? role;

  Role({this.role});

  Role.fromJson(dynamic json) {
    role = json['role'];
  }
}
