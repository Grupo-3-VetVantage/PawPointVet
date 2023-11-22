class Veterinary {
  final int id;
  final String name;
  final String lastname;
  final String speciality;
  final String email;
  final String password;
  final String phone;
  final String addres;
  final String description;
  final String imgUrl;

  const Veterinary(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.speciality,
      required this.email,
      required this.password,
      required this.phone,
      required this.addres,
      required this.description,
      required this.imgUrl});

  Veterinary.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        lastname = json["lastName"],
        speciality = json["speciality"],
        email = json["email"],
        password = json["password"],
        phone = json["phone"],
        addres = json["address"],
        description = json["description"],
        imgUrl = json ["imgUrl"];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'lastName': lastname,
      'speciality': speciality,
      'email': email,
      'password': password,
      'phone': phone,
      'address': addres,
      'description': description,
      'imgUrl': imgUrl,
    };
  }

  Veterinary.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        lastname = map['lastName'],
        speciality = map['speciality'],
        email = map['email'],
        password = map['password'],
        phone = map['phone'],
        addres = map['address'],
        description = map['description'],
        imgUrl = map['imgUrl'];
}
