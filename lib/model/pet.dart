class Pet {
  final int id;
  final String name;
  final int age;
  final String description;
  final int weight;
  final String dateOfBirth;
  final String imgUrl;
  final String specie;
  final int ownerId;

  const Pet(
      {required this.id,
      required this.name,
      required this.age,
      required this.description,
      required this.weight,
      required this.dateOfBirth,
      required this.imgUrl,
      required this.specie,
      required this.ownerId});
  
  Pet.fromJson(Map<String, dynamic> json):
    id = json["id"],
    name = json["name"],
    age = json["age"],
    description = json["description"],
    weight = json["weight"],
    dateOfBirth = json["dateOfBirth"],
    imgUrl = json["imgUrl"],
    specie = json["specie"],
    ownerId = json["ownerId"];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'description': description,
      'weight': weight,
      'dateOfBirth': dateOfBirth,
      'imgUrl': imgUrl,
      'specie': specie,
      'ownerId': ownerId,
    };
  }
  Pet.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        age = map['age'],
        description = map['description'],
        weight = map['weight'],
        dateOfBirth = map['dateOfBirth'],
        imgUrl = map['imgUrl'],
        specie = map['specie'],
        ownerId = map['ownerId'];
}