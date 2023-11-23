import 'package:flutter/material.dart';
import 'package:veterinariesapp/model/meeting.dart';
import 'package:veterinariesapp/model/pet.dart';
import 'package:veterinariesapp/model/update_meeting.dart';
import 'package:veterinariesapp/services/veterinary_service.dart';
import 'package:veterinariesapp/screens/appointment_desc.dart';

class ScheduledAppointment extends StatefulWidget {
  const ScheduledAppointment({Key? key}) : super(key: key);

  @override
  State<ScheduledAppointment> createState() => _ScheduledAppointmentState();
}

class _ScheduledAppointmentState extends State<ScheduledAppointment> {
  late List<Meeting> meetings;
  late List<Pet> pets;
  final veterinaryService = VeterinaryService();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    meetings = [];
    pets = [];
    _loadData();
  }

  Future<void> _loadData() async {
    final loadedMeetings = await veterinaryService.getAllMeetings(1, 10);
    final loadedPets = await veterinaryService.getAllPets(1, 10);

    if (loadedMeetings != null && loadedPets != null) {
      setState(() {
        meetings = loadedMeetings;
        pets = loadedPets;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: meetings.isEmpty ? 1 : meetings.length + 1,
              itemBuilder: (context, index) {
                if (meetings.isEmpty) {
                  return const ListTile(
                    leading: Icon(Icons.info_sharp),
                    title: Text('Presiona en un elemento de la lista para ver la descripción'),
                  );
                } else if (index == 0) {
                  return const ListTile(
                    leading: Icon(Icons.info),
                    title: Text('Presiona en un elemento de la lista para ver la descripción'),
                  );
                }

                final meeting = meetings[index - 1];
                final pet = pets.firstWhere(
                  (pet) => pet.ownerId == meeting.userId,
                  orElse: () => const Pet(
                    id: 0,
                    name: 'No encontrado',
                    age: 0,
                    description: '',
                    weight: 0,
                    dateOfBirth: '',
                    imgUrl: '',
                    specie: '',
                    ownerId: 0
                  ),
                );
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AppointmentDescription(meeting: meeting, pet: pet),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(pet.imgUrl),
                  ),
                  title: Text(pet.name),
                  subtitle: Text(meeting.finish ? 'Consulta realizada' : 'Pendiente de realizar'),
                  trailing: GestureDetector(
                    onTap: () {
                      _toggleMeetingStatus(meeting);
                    },
                    child: Container(
                      width: 40.0,
                      height: 40.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: meeting.finish ? Colors.green : Colors.grey,
                      ),
                      child: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }

  void _toggleMeetingStatus(Meeting meeting) async {
    final success = await veterinaryService.updateMeeting(UpdateMeeting(
      id: meeting.id,
      dateToMeet: meeting.dateToMeet,
      finish: !meeting.finish,
      description: meeting.description,
      vetId: meeting.vetId,
      userId: meeting.userId,
      petId: meeting.petId,
    ));
    if (success) {
      _loadData();
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('No se pudo actualizar el estado de la cita.'),
      ));
    }
  }
}
