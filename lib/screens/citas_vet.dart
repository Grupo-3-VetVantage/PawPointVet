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
      body: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://cdn.discordapp.com/attachments/1114380845432705024/1168263999197024326/image.png?ex=655121a2&is=653eaca2&hm=1056385991e3f521c59b7616f1623a07983bfebe4cad4c2fef119025dae21b96&', // Reemplaza con la URL de la imagen de Internet
                  width: 100, // Ancho de la imagen
                  height: 100, // Alto de la imagen
                ),
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    'https://cdn.discordapp.com/attachments/1114380845432705024/1168264033527410708/image.png?ex=655121aa&is=653eacaa&hm=5f1dd932697e3c2bcbd67c30ce449d4ab88a1d46e8093a46e942d70d007b719c&',
                    // Reemplaza con la URL de la foto de perfil
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Lógica para el primer "botón"
                  },
                  child: Container(
                    width: 300,
                    height: 150,
                    color: Colors.blue,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://cdn.discordapp.com/attachments/1114380845432705024/1168202662156709960/image.png?ex=6550e882&is=653e7382&hm=bf476af3e29c685fe502ca7c29a3f0f29e6304c50ff860ed4b41d15a165a083e&',
                              width: 250,
                              height: 100,
                            ),
                          ),
                          Text(
                            'Citas Agendadas',
                            style: TextStyle(
                              color: Colors.white,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    // Lógica para el segundo "botón"
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.green,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://cdn.discordapp.com/attachments/1114380845432705024/1168202705513218228/image.png?ex=6550e88d&is=653e738d&hm=8fb042b6bba117a386bab83c7a08f6a6ef769ba9bffc066f806cf4e4cca0d8e9&',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            'Citas Agendadas',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Lógica para el tercer "botón"
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    color: Colors.orange,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              'https://cdn.discordapp.com/attachments/1114380845432705024/1168202802544255007/image.png?ex=6550e8a4&is=653e73a4&hm=ee69ed531bb7f7d1d3c7ba3de1830359d428234220a360fc4dd8569090e003ee&',
                              width: 100,
                              height: 100,
                            ),
                          ),
                          Text(
                            'Historial de Citas',
                            style: TextStyle(
                              color: Colors.white,
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
    );
  }
}
