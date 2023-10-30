import 'package:flutter/material.dart';
import 'package:veterinariesapp/screens/appointment_desc.dart';

class ScheduledAppointment extends StatefulWidget {
  const ScheduledAppointment({Key? key}) : super(key: key);

  @override
  State<ScheduledAppointment> createState() => _ScheduledAppointmentState();
}

class _ScheduledAppointmentState extends State<ScheduledAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Citas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AppointmentDescription()),
                );
              },
              child: Row(
                children: <Widget>[
                  Icon(Icons.book),
                  SizedBox(width: 8.0),
                  Text('Descripción de Citas'),
                ],
              ),
            ),
          ),
          AppointmentItem(
            petImage: 'https://www.elcomercio.com/wp-content/uploads/2023/01/perrito.jpg',
            petName: 'Lila',
            appointmentType: 'Consulta General',
            completed: false,
          ),
          AppointmentItem(
            petImage: 'https://mf.b37mrtl.ru/actualidad/public_images/2019.04/article/5ca865b308f3d9f63a8b4567.jpg',
            petName: 'Matie',
            appointmentType: 'Profilaxis',
            completed: true,
          ),
          AppointmentItem(
            petImage: 'https://cdn.shopify.com/s/files/1/0268/6861/files/husky-siberiano-bosque_edaaae94-40fa-4d86-a905-4d9df2b63232_480x480.jpg',
            petName: 'Neil',
            appointmentType: 'Consulta Urgencias',
            completed: false,
          ),
          AppointmentItem(
            petImage: 'https://t1.ea.ltmcdn.com/es/posts/5/6/2/10_caracteristicas_de_los_perros_24265_600_square.jpg',
            petName: 'Nacho',
            appointmentType: 'Consulta General',
            completed: false,
          ),
        ],
      ),
    );
  }
}

class AppointmentItem extends StatelessWidget {
  final String petImage;
  final String petName;
  final String appointmentType;
  final bool completed;

  AppointmentItem({
    required this.petImage,
    required this.petName,
    required this.appointmentType,
    required this.completed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(petImage),
      ),
      title: Text(petName),
      subtitle: Text(appointmentType),
      trailing: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: completed ? Colors.green : Colors.grey,
        ),
        child: Icon(
          Icons.check,
          color: Colors.white,
        ),
      ),
    );
  }
}
