import 'package:flutter/material.dart';

class AppointmentDescription extends StatefulWidget {
  const AppointmentDescription({Key? key}) : super(key: key);

  @override
  State<AppointmentDescription> createState() => _AppointmentDescriptionState();
}

class _AppointmentDescriptionState extends State<AppointmentDescription> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Descripción de Citas'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          AppointmentItem(
            petImage: 'https://www.elcomercio.com/wp-content/uploads/2023/01/perrito.jpg',
            petName: 'Lila',
            description: 'Lila necesita una revisión general.',
          ),
          AppointmentItem(
            petImage: 'https://mf.b37mrtl.ru/actualidad/public_images/2019.04/article/5ca865b308f3d9f63a8b4567.jpg',
            petName: 'Matie',
            description: 'Matie necesita profilaxis dental.',
          ),
          AppointmentItem(
            petImage: 'https://cdn.shopify.com/s/files/1/0268/6861/files/husky-siberiano-bosque_edaaae94-40fa-4d86-a905-4d9df2b63232_480x480.jpg',
            petName: 'Neil',
            description: 'Neil tiene una urgencia médica.',
          ),
          AppointmentItem(
            petImage: 'https://t1.ea.ltmcdn.com/es/posts/5/6/2/10_caracteristicas_de_los_perros_24265_600_square.jpg',
            petName: 'Nacho',
            description: 'Nacho necesita una consulta general.',
          ),
        ],
      ),
    );
  }
}

class AppointmentItem extends StatelessWidget {
  final String petImage;
  final String petName;
  final String description;

  AppointmentItem({
    required this.petImage,
    required this.petName,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(petImage),
      ),
      title: Text(petName),
      subtitle: Text(description),
    );
  }
}
