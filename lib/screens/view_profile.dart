import 'package:flutter/material.dart';

class ProfileView extends StatelessWidget {
  final Map<String, dynamic> data;
  const ProfileView({Key? key, required this.data}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background(context),
          _profileImage(context),
          _vetInfo(context),
        ],
      )
    );
  }
  //
  //fondo
  Widget _background(BuildContext context){
    String imageBack="https://i.ibb.co/WHQD867/fondo-Patitas.png";
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(imageBack),
            fit: BoxFit.contain,
            alignment: Alignment.topCenter,
          ),
          color: const Color.fromRGBO(3, 188, 190, 1),
        ),
      ),
    );
  }

  //image
 Widget _profileImage (BuildContext context){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            child: Container(
              margin: const EdgeInsets.only(top: 50),
              width: 230,
              height: 250,
              color: Colors.transparent,
              child: Center(
                child: data['image'].isEmpty
                    ? const Icon(Icons.image_search_rounded, size: 150, color: Colors.black)
                    : Image.network(data['image']),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //vet info
  Widget _vetInfo(BuildContext context){
     return Center(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(top: 280),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              color: Colors.white,
               child: Column(
                 children: [
                          Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text.rich(
                          TextSpan(
                              children: [
                                  TextSpan(
                                      text: data['name'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                  const TextSpan(text: ' ',),
                                  TextSpan(
                                      text: data['lastName'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                  const TextSpan(text: '\n', ),
                                  TextSpan(
                                      text: data['speciality'],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(161, 161, 161, 1),
                                          fontSize: 20,
                                      ),
                                  ),
                                   const TextSpan(text: '\n\n',),
                                  TextSpan(
                                      text: data['address'],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(161, 161, 161, 1),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                      ),
                                  ),
                                  const TextSpan(  text: '\n\n\n', ),
                                  const WidgetSpan(
                                    child: Padding(
                                      padding: EdgeInsets.only(right: 4.0),
                                      child: Icon(
                                        Icons.phone, size: 30, color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  TextSpan(
                                      text: data['phone'],
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                      ),
                                  ),
                                  const TextSpan(text: '\n\n\n',),
                                  const TextSpan(
                                      text: 'About Doctor ',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 25,
                                      ),
                                  ),
                                   const TextSpan(text: '\n', ),
                                  TextSpan(
                                      text: data['description'],
                                      style: const TextStyle(
                                          color: Color.fromRGBO(161, 161, 161, 1),
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                      ),
                                  ),
                ],
               ),
             ),
            )
           ],
          ),
        ),  
      ),      
    );
  }

  
}