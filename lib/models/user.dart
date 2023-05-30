class User {
  final int? id;
  final String? fullname;
  final String? email;
  final String? token;

  User({this.id, this.fullname, this.email, this.token});

  factory User.fromJson(Map<String, dynamic> json) => User(
      id: json["id"],
      fullname: json["fullname"],
      email: json["email"],
      token: json['token']);

  Map<String, dynamic> toJson() =>
      {"id": id, "fullname": fullname, "email": email, 'token': token};
}
