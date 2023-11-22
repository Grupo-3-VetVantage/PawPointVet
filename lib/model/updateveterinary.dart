class UpdateVet {
  final int id;
  final String name;
  final String lastname;
  final String speciality;
  final String phone;
  final String addres;
  final String description;
  final String imgUrl;


  const UpdateVet(
      {required this.id,
      required this.name,
      required this.lastname,
      required this.speciality,
      required this.phone,
      required this.addres,
      required this.description,
      required this.imgUrl});

  UpdateVet.fromJson(Map<String, dynamic> json)
      : id = json["id"],
        name = json["name"],
        lastname = json["lastName"],
        speciality = json["speciality"],
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
      'phone': phone,
      'address': addres,
      'description': description,
      'imgUrl': imgUrl
    };
  }

  UpdateVet.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        lastname = map['lastName'],
        speciality = map['speciality'],
        phone = map['phone'],
        addres = map['address'],
        description = map['description'],
        imgUrl = map['imgUrl'];
}
