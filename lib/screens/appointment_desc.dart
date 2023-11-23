import 'package:flutter/material.dart';
import 'package:veterinariesapp/model/meeting.dart';
import 'package:veterinariesapp/model/pet.dart';

class AppointmentDescription extends StatelessWidget {
  final Meeting meeting;
  final Pet pet;

  const AppointmentDescription({Key? key, required this.meeting, required this.pet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descripción de la cita'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Column(
            children: [
              ListTile(
                title: Text(
                  pet.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Edad: ${pet.age}, Fecha de nacimiento: ${pet.dateOfBirth}'),
                    Text('Descripción: ${pet.description}'),
                  ],
                ),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(pet.imgUrl),
                ),
              ),
              ListTile(
                title: const Text('Descripción de la cita'),
                subtitle: Text(meeting.description),
              ),
              ListTile(
                title: const Text('Fecha de la cita'),
                subtitle: Text(meeting.dateToMeet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
