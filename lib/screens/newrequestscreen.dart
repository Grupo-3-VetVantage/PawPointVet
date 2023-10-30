import 'package:flutter/material.dart';

class NewRequestsScreen extends StatefulWidget {
  const NewRequestsScreen({Key? key}) : super(key: key);

  @override
  _NewRequestsScreenState createState() => _NewRequestsScreenState();
}

class _NewRequestsScreenState extends State<NewRequestsScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
            Navigator.pop(context); // Go back when the back button is pressed
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
          RequestsList(isPrioritaries: true),
          RequestsList(isPrioritaries: false),
        ],
      ),
    );
  }
}

class RequestsList extends StatelessWidget {
  final bool isPrioritaries;

  RequestsList({required this.isPrioritaries});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        // Create cards for each request based on the isPrioritaries flag
        if (isPrioritaries)
          RequestCard(
            animalImage:
                'https://as01.epimg.net/diarioas/imagenes/2022/05/29/actualidad/1653826510_995351_1653826595_noticia_normal_recorte1.jpg',
            petType: 'Dog',
            serviceType: 'Checkup',
            serviceTime: '10:00 AM',
          ),
        RequestCard(
          animalImage:
              'https://static.nationalgeographic.es/files/styles/image_3200/public/75552.ngsversion.1422285553360.jpg?w=1600&h=1067',
          petType: 'Cat',
          serviceType: 'Vaccination',
          serviceTime: '11:30 AM',
        ),
        // Add more RequestCard widgets as needed
      ],
    );
  }
}

class RequestCard extends StatelessWidget {
  final String animalImage;
  final String petType;
  final String serviceType;
  final String serviceTime;

  RequestCard({
    required this.animalImage,
    required this.petType,
    required this.serviceType,
    required this.serviceTime,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle card click, navigate to more details
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
