import 'package:flutter/material.dart';
import 'package:veterinariesapp/model/veterinary_model.dart';
import 'package:veterinariesapp/screens/view_profile.dart';
import 'package:veterinariesapp/services/veterinary_service.dart';

//stf
class EditVetProfile extends StatefulWidget {
  final Veterinary? data;
  EditVetProfile({Key? key, required this.data}):super(key: key);
  
  final keyForm = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final lastNameController = TextEditingController();
  final specialityController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final descriptionController = TextEditingController();


  @override
  State<EditVetProfile> createState() => _EditVetProfileState();
}

class _EditVetProfileState extends State<EditVetProfile> {
  String imageUrl = "";
  void updateImageUrl(String newImage){
    setState(() {
      imageUrl = newImage;
    });
  }
  //inicializar con los datos actuales
  @override
  void initState(){
    super.initState();
    widget.nameController.text = widget.data?.name ?? "";
    widget.lastNameController.text = widget.data?.lastname ?? "";
    widget.specialityController.text = widget.data?.speciality ?? "";
    widget.phoneController.text = widget.data?.phone ?? "";
    widget.addressController.text = widget.data?.addres ?? "";
    widget.descriptionController.text = widget.data?.description ?? "";
    imageUrl = widget.data?.imgUrl ?? "";
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _background(context),
          _addImage(context),
          _formProfile(context),
        ],
      )
    );
  }

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
 Widget _addImage (BuildContext context){
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Add imageUrl'),
                    content: TextField(
                      onChanged: (value) {
                        updateImageUrl(value);
                      },
                    ),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Container(
              margin: const EdgeInsets.only(top: 70),
              width: 200,
              height: 200,
              color: Colors.white,
              child: Center(
                child: imageUrl.isEmpty
                    ? const Icon(Icons.image_search_rounded, size: 150, color: Colors.black)
                    : Image.network(imageUrl),
              ),
            ),
          ),
        ],
      ),
    );
  }

//form
  Widget _formProfile (BuildContext context){
    return Center(
          child: Container(
            margin: const EdgeInsets.only(top: 300),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              color: Colors.white,
              margin: EdgeInsets.zero,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: widget.keyForm,
                   child: ListView(
                  children: <Widget>[
                    _showName(),
                    const SizedBox(height: 10.0),
                    _showLastName(),
                    const SizedBox(height: 10.0),
                    _showSpeciality(), 
                    const SizedBox(height: 10.0),
                    _showPhone(),
                    const SizedBox(height: 10.0),
                    _showAddress(),
                    const SizedBox(height: 10.0),
                    _showDescription(),
                    const SizedBox(height: 10.0),
                    _buttonAdd(),
                    const SizedBox(height: 30),
                    
                  ],
                ),
                ),
              ),
            ),
          ),
        );
  }
//show
   Widget _showName() {
    return TextFormField(
    controller: widget.nameController,
    decoration: const InputDecoration(
      labelText: "Name",
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black ), 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 218, 220, 1)), 
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.black),
    );
  }

  Widget _showLastName() {
    return TextFormField(
    controller: widget.lastNameController,
    decoration: const InputDecoration(
      labelText: "LastName",
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black ), 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 218, 220, 1)), 
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.black),
    );
  }

   Widget _showSpeciality() {
    return TextFormField(
    controller: widget.specialityController,
    decoration: const InputDecoration(
      labelText: "Speciality",
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black ), 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 218, 220, 1)), 
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.black),
    );
  }

  Widget _showPhone() {
    return TextFormField(
    controller: widget.phoneController,
    decoration: const InputDecoration(
      labelText: "Phone",
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black ), 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 218, 220, 1)), 
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.black),
    );
  }

  Widget _showAddress() {
    return TextFormField(
    controller: widget.addressController,
    decoration: const InputDecoration(
      labelText: "Address",
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black ), 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 218, 220, 1)), 
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.black),
    );
  }


  Widget _showDescription() {
    return TextFormField(
    controller: widget.descriptionController,
    decoration: const InputDecoration(
      labelText: "Description",
      labelStyle: TextStyle(color: Colors.black),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black ), 
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(216, 218, 220, 1)), 
      ),
    ),
    keyboardType: TextInputType.text,
    style: const TextStyle(color: Colors.black),
    );
  }

  Widget _buttonAdd(){
    return  ElevatedButton(
   onPressed: ()async{
     if(widget.keyForm.currentState?.validate() ?? false){
      Veterinary update = Veterinary(
        id: widget.data?.id ?? 0, 
        name: widget.nameController.text, 
        lastname: widget.lastNameController.text, 
        speciality: widget.specialityController.text, 
        phone: widget.phoneController.text, 
        addres: widget.addressController.text, 
        description: widget.descriptionController.text, 
        imgUrl: imageUrl,);
      VeterinaryService().updateVeterinaryProfile(update).then((success){ 
          if(success){
            print('Profile updated successfully');
            Navigator.push(context,MaterialPageRoute(builder: (context) => ProfileView(data: update)),
      );
          }else{
            print('Failed to update profile');
          }
      });
     }
    },
    style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(const Color.fromRGBO(22, 44, 81, 1)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20),
    )),
    textStyle: MaterialStateProperty.all(const TextStyle(
    color: Colors.blue,
    fontSize: 20,
    )),
    padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
    ),
    child: const Text("Save"),
    );
  }
}


//
