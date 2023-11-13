class Veterinary {
  final String id;
  final String name;
  final String lastname;
  final String speciality;
  final String email;
  final String password;
  final String phone;
  final String addres;

  const Veterinary(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.speciality,
      required this.email,
      required this.password,
      required this.phone,
      required this.addres});

  Veterinary.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        lastname = json["lastname"],
        speciality = json["speciality"],
        email = json["email"],
        password = json["password"],
        phone = json["phone"],
        addres = json["addres"];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastname': lastname,
      'speciality': speciality,
      'email': email,
      'password': password,
      'phone': phone,
      'addres': addres
    };
  }

  Veterinary.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        lastname = map['lastname'],
        speciality = map['speciality'],
        email = map['email'],
        password = map['password'],
        phone = map['phone'],
        addres = map['addres'];
}
