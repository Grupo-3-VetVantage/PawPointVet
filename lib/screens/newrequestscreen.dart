import 'package:flutter/material.dart';
import 'package:veterinariesapp/model/meeting.dart';
import 'package:veterinariesapp/model/pet.dart';
import 'package:veterinariesapp/screens/priority_appointment.dart';
import 'package:veterinariesapp/services/veterinary_service.dart';

class NewRequestsScreen extends StatefulWidget {
  final int vetId;
  const NewRequestsScreen({Key? key, required this.vetId}) : super(key: key);

  @override
  _NewRequestsScreenState createState() => _NewRequestsScreenState();
}

class _NewRequestsScreenState extends State<NewRequestsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  List<Meeting> meetings = []; // Todas
  List<Meeting> priorityMeetings = []; // Prioridades

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getMeetings();
  }

  void getMeetings() async {
    VeterinaryService veterinaryService = VeterinaryService();
    List<Meeting>? fetchedMeetings =
        await veterinaryService.getMeetingByVetId(widget.vetId);
    if (fetchedMeetings != null) {
      setState(() {
        meetings = fetchedMeetings;
        priorityMeetings = meetings
            .where((element) =>
                element.description.toLowerCase().contains('emergency'))
            .toList();
      });
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Requests'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'PRIORITARIAS'),
            Tab(text: 'OTRAS CITAS'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          RequestsList(meetings: priorityMeetings),
          RequestsList(meetings: meetings),
        ],
      ),
    );
  }
}

class RequestsList extends StatelessWidget {
  final List<Meeting> meetings;

  RequestsList({required this.meetings});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
       for (Meeting meeting in meetings)
          FutureBuilder<Pet?>(
            future: VeterinaryService().getPetById(meeting.petId),
            builder: (context, AsyncSnapshot<Pet?> snapshot) {
              if (snapshot.hasData && snapshot.data != null) {
                final Pet pet = snapshot.data!;

                return RequestCard(
                  petName: pet.name,
                  animalImage: pet.imgUrl,
                  petType: pet.specie,
                  serviceType: meeting.description,
                  serviceTime: meeting.dateToMeet.toString(),
                );
              } else {
                // Si no hay datos disponibles, puedes retornar un widget alternativo
                return Container();
              }
            },
          ),
      ],
    );
  }
}

class RequestCard extends StatelessWidget {
  final String petName;
  final String animalImage;
  final String petType;
  final String serviceType;
  final String serviceTime;
  RequestCard({
    required this.petName,
    required this.animalImage,
    required this.petType,
    required this.serviceType,
    required this.serviceTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PriorityAppointmentScreen(
              petName: petName,
              animalImage: animalImage,
              petType: petType,
              serviceType: serviceType,
              serviceTime: serviceTime,
            ),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(animalImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pet Name: $petName'),
                  Text('Pet Type: $petType'),
                  Text('Service Type: $serviceType'),
                  Text('Service Time: $serviceTime'),
                ],
              ),
            ),
            Icon(Icons.arrow_forward),
          ],
        ),
      ),
    );
  }
}