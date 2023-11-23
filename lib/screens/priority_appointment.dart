import 'package:flutter/material.dart';

class PriorityAppointmentScreen extends StatefulWidget {
  final String petName;
  final String animalImage;
  final String petType;
  final String serviceType;
  final String serviceTime;

  PriorityAppointmentScreen({
    required this.petName,
    required this.animalImage,
    required this.petType,
    required this.serviceType,
    required this.serviceTime,
  });

  @override
  _PriorityAppointmentScreenState createState() =>
      _PriorityAppointmentScreenState();
}

class _PriorityAppointmentScreenState extends State<PriorityAppointmentScreen> {
  bool isConfirmationVisible = false;
  late String selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = '--:--';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CITA ANIMAL', style: TextStyle(color: Colors.white)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(
                context); // Regresar cuando se presiona el botón de retroceso
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      CircleAvatar(
                        radius: 75,
                        backgroundImage: NetworkImage(widget.animalImage),
                      ),
                      SizedBox(height: 20),
                      buildInfoRow(Icons.schedule,
                          'Nombre : ${widget.petName}'),
                      SizedBox(height: 20),
                      buildInfoRow(Icons.schedule,
                          'Fecha y Hora: ${widget.serviceTime}'),
                      SizedBox(height: 20),
                      buildInfoRow(Icons.category,
                          'Tipo de Servicio: ${widget.serviceType}'),
                      SizedBox(height: 20),
                      buildInfoCard(
                        Icons.description,
                        'Descripción de Síntomas:',
                        'Aquí se detallan los síntomas que tiene el animal.',
                      ),
                      SizedBox(height: 20),
                      buildInfoCard(
                        Icons.build,
                        'Implementos Necesarios:',
                        'Ejemplo: Termómetro, Estetoscopio, Suero.',
                      ),
                      SizedBox(height: 20),
                      buildInfoCard(
                        Icons.location_on,
                        'Ubicación:',
                        'Calle y Avenida, Ciudad.',
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isConfirmationVisible = true;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFF162C51),
                          padding: EdgeInsets.symmetric(
                              vertical: 15, horizontal: 40),
                        ),
                        child: Text(
                          'Aceptar Cita',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (isConfirmationVisible)
            Center(
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 500),
                opacity: isConfirmationVisible ? 1.0 : 0.0,
                child: ConfirmationCard(
                  selectedTime: selectedTime,
                  onSelect: (String time) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  onClose: () {
                    setState(() {
                      isConfirmationVisible = false;
                    });
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Color(0xFF03BDBF)),
        SizedBox(width: 5),
        Text(text, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget buildInfoCard(IconData icon, String title, String text) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Color(0xFF03BDBF)),
                SizedBox(width: 10),
                Text(title,
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 10),
            Text(text, style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

class ConfirmationCard extends StatefulWidget {
  final String selectedTime;
  final VoidCallback onClose;
  final Function(String) onSelect;

  ConfirmationCard({
    required this.selectedTime,
    required this.onClose,
    required this.onSelect,
  });

  @override
  _ConfirmationCardState createState() => _ConfirmationCardState();
}

class _ConfirmationCardState extends State<ConfirmationCard> {
  late String selectedTime;
  bool isCitaAgendada = false;

  @override
  void initState() {
    super.initState();
    selectedTime = widget.selectedTime;
  }

  void confirmCita() {
    // Puedes agregar aquí cualquier lógica adicional cuando se confirme la cita.
    setState(() {
      isCitaAgendada = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Fondo semitransparente
        Container(
          color: Colors.black.withOpacity(0.5),
        ),
        Center(
          child: Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        onPressed: widget.onClose,
                        icon: Icon(Icons.close),
                        color: Colors.red,
                      ),
                    ],
                  ),
                  if (isCitaAgendada)
                    Image.network(
                      'https://cdn.discordapp.com/attachments/1172734491681370124/1173463642939854998/image.png?ex=65640c2e&is=6551972e&hm=93b2a5ea3c0a7b8d94d8fc66508f7e065e0092d083e3a22b7752366788c66b85&', // Reemplaza con la URL de tu imagen
                      height: 100,
                      width: 100,
                    ),
                  Text(
                    isCitaAgendada
                        ? 'Cita agendada con éxito'
                        : 'Confirmar hora',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight:
                          isCitaAgendada ? FontWeight.bold : FontWeight.normal,
                      color: isCitaAgendada ? Color(0xFF03BDBF) : null,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    isCitaAgendada
                        ? 'Tu cita ha sido agendada correctamente.'
                        : 'Selecciona la hora de llegada aproximada para mantener informado al usuario.',
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 20),
                  if (!isCitaAgendada)
                    DropdownButton<String>(
                      value: selectedTime,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTime = newValue!;
                          widget.onSelect(selectedTime);
                        });
                      },
                      items: <String>[
                        '--:--',
                        '8:00 AM',
                        '11:00 AM',
                        '3:00 PM',
                        '6:00 PM',
                        '8:00 PM'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: isCitaAgendada ? null : confirmCita,
                    style: ElevatedButton.styleFrom(
                      primary: isCitaAgendada ? Colors.grey : Color(0xFF162C51),
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    ),
                    child: Text(
                      isCitaAgendada ? 'Cita Agendada' : 'Agendar Cita',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
