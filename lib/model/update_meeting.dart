class UpdateMeeting {
  final int id;
  final String dateToMeet;
  final bool finish;
  final String description;
  final int vetId;
  final int userId;

  const UpdateMeeting(
      {required this.id,
      required this.dateToMeet,
      required this.finish,
      required this.description,
      required this.vetId,
      required this.userId});
  
  UpdateMeeting.fromJson(Map<String, dynamic> json):
    id = json["id"],
    dateToMeet = json["dateToMeet"],
    finish = json["finish"],
    description = json["description"],
    vetId = json["vetId"],
    userId = json["userId"];
    
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'dateToMeet': dateToMeet,
      'finish': finish,
      'description': description,
      'vetId': vetId,
      'userId': userId,
    };
  }

  UpdateMeeting.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        dateToMeet = map['dateToMeet'],
        finish = map['finish'],
        description = map['description'],
        vetId = map['vetId'],
        userId = map['userId'];
}