import 'package:flutter/material.dart';

/**
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "BottomNavigationBar",
      home: CitasVet(),
    );
  }
}

class CitasVet extends StatefulWidget {
  const CitasVet({Key? key}) : super(key: key);

  @override
  _CitasVetState createState() => _CitasVetState();
}

class _CitasVetState extends State<CitasVet> {
  var _currentPage = 0;
  final _colores = [
    Colors.green[200],
    Colors.yellow,
    Colors.blue[200],
  ];
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          Container(
            color: _colores[0],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Citas Agendadas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  // Agrega aquí el contenido de "Citas Agendadas"
                ],
              ),
            ),
          ),
          Container(
            color: _colores[1],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Citas Agendadas 2', // Cambia el título si es necesario
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  // Agrega aquí el contenido de la segunda página
                ],
              ),
            ),
          ),
          Container(
            color: _colores[2],
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Historial de Citas',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  // Agrega aquí el contenido del historial de citas
                ],
              ),
            ),
          ),
        ],
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Citas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Clientes",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "Tienda",
          ),
        ],
        currentIndex: _currentPage,
        onTap: (int index) {
          _pageController.animateToPage(index,
              duration: const Duration(milliseconds: 500), curve: Curves.ease);
        },
      ),
    );
  }
}
*/