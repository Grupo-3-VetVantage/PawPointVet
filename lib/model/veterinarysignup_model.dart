class VeterinarySignup {
  final String email;
  final String password;
  final String name;
  final String username;

  const VeterinarySignup(
      {required this.email,
      required this.password,
      required this.name,
      required this.username});

  VeterinarySignup.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        password = json["password"],
        name = json["name"],
        username = json["username"];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
      'name': name,
      'username': username
    };
  }

  VeterinarySignup.fromMap(Map<String, dynamic> map)
      : email = map['email'],
        password = map['password'],
        name = map['name'],
        username = map['username'];
}
