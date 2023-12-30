// import 'dart:convert';

class User {
  //tu class User -> chuyen thanh dang json
  // User userFromJson(String str) {
  //   final jsonData = json.decode(str);
  //   return User.fromMap(jsonData);
  // }

  // // Nguoc lai
  // String UserToJson(User data) {
  //   final dyn = data.toMap();
  //   return json.encode(dyn);
  // }

  String? id;
  String? full_name;
  String? email;
  String? username;
  String? password;
  String? image;
  DateTime? date;

  User(
      {this.id,
      this.email,
      this.full_name,
      this.username,
      this.date,
      this.image,
      this.password});
  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "full_name": full_name,
        "username": username,
        "password": password,
        "image": image,
        "date": date?.toIso8601String(),
        // "date": date,
      };

  // nhan vao 1 dang map va chuyen thanh class User
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"],
        email: json["email"],
        full_name: json["full_name"],
        username: json["username"],
        image: json["image"],
        password: json["password"],
        date: DateTime.parse(json['date']));
    // date: json['date']);
  }
}
