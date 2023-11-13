class VeterinaryLogin {
  final String email;
  final String password;

  const VeterinaryLogin({required this.email, required this.password});

  VeterinaryLogin.fromJson(Map<String, dynamic> json)
      : email = json["email"],
        password = json["password"];
  
  Map<String , dynamic> toMap(){
    return {'email':email, 'password': password};
  }

  VeterinaryLogin.fromMap(Map<String,dynamic> map): email = map['email'], password = map['password'];
}
