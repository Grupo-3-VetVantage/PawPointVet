import 'package:flutter/material.dart';

class VetCitas extends StatefulWidget {
  const VetCitas({Key? key}) : super(key: key);

  @override
  _VetCitas createState() => _VetCitas();
}

class _VetCitas extends State<VetCitas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.network(
                      'https://cdn.discordapp.com/attachments/1114380845432705024/1168263999197024326/image.png',
                      width: 100,
                      height: 100,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://cdn.discordapp.com/attachments/1114380845432705024/1168264033527410708/image.png',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ), // Espacio entre encabezado y cuadros de abajo
              InkWell(
                onTap: () {
                  // Lógica para el primer "botón"
                },
                child: Container(
                  width: 350, // Tamaño del cuadro de arriba
                  height: 190,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            'https://cdn.discordapp.com/attachments/1114380845432705024/1168202662156709960/image.png',
                            width: 350, // Tamaño del cuadro de arriba
                            height: 150,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Citas Agendadas',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height:
                      30), // Espacio entre cuadro de arriba y los cuadros de abajo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      // Lógica para el segundo "botón"
                    },
                    child: Container(
                      width: 160,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://cdn.discordapp.com/attachments/1114380845432705024/1168202705513218228/image.png',
                                width: 130,
                                height: 100,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              'Citas Agendadas',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                      width:
                          30), // Espacio entre los cuadros de abajo (izquierda y derecha)
                  InkWell(
                    onTap: () {
                      // Lógica para el tercer "botón"
                    },
                    child: Container(
                      width: 160,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                'https://cdn.discordapp.com/attachments/1114380845432705024/1168202802544255007/image.png',
                                width: 130,
                                height: 100,
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(top: 8)),
                            Text(
                              'Historial de Citas',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
