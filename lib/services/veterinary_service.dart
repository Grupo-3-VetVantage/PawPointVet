import 'dart:io';
import 'dart:convert';
import 'package:veterinariesapp/model/meeting.dart';
import 'package:veterinariesapp/model/pet.dart';
import 'package:veterinariesapp/model/update_meeting.dart';
import 'package:veterinariesapp/model/updateveterinary.dart';
import 'package:veterinariesapp/model/veterinaryLogin_model.dart';
import 'package:http/http.dart' as http;
import 'package:veterinariesapp/model/veterinary_model.dart';
import 'package:veterinariesapp/model/veterinarysignup_model.dart';
class VeterinaryService{
  final baseUrl = 'https://vetvantageapp.azurewebsites.net/api/';
  //get all veterinaries
  Future<List<Veterinary>?> getAll(int page, int size) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/Veterinary"));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final veterinaries = <Veterinary>[];
      for (var item in jsonResponse) {
        veterinaries.add(Veterinary.fromJson(item));
      }
      return veterinaries;
    }
    return null;
  }

  //login
  Future<Veterinary?> loginVet(VeterinaryLogin veterinaryLogin) async {
    http.Response response = await http.post(
      Uri.parse("$baseUrl/Veterinary/Login"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(veterinaryLogin.toMap()),
    );
    if (response.statusCode == HttpStatus.ok) {
      if (response.body.isNotEmpty) {
        final jsonResponse = json.decode(response.body);
        final veterinary = Veterinary.fromJson(jsonResponse);
        return veterinary;
      } else {
        print('Signup failed. Server response is empty.');
        return null;
      }
    } else {
      print('Signup failed. Server returned status: ${response.statusCode}');
      return null;
    }
  }
  //signup
  Future<VeterinarySignup?> signup(VeterinarySignup veterinary) async {
    http.Response response = await http.post(
      Uri.parse("$baseUrl/Veterinary/SignUp"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(veterinary.toMap()),
    );

    if (response.statusCode == HttpStatus.ok) {
      if (response.body.isNotEmpty) {
        final jsonResponse = json.decode(response.body);
        final veterinarySignup = VeterinarySignup.fromJson(jsonResponse);
        return veterinarySignup;
      } else {
        print('Signup failed. Server response is empty.');
        return null;
      }
    } else {
      print('Signup failed. Server returned status: ${response.statusCode}');
      return null;
    }
  }
  //veterinary/id
  Future<Veterinary?> getVeterinaryById(int id) async{
    http.Response response = await http.get(
      Uri.parse("$baseUrl/Veterinary/$id"),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',},
    );
    if(response.statusCode == HttpStatus.ok){
      final jsonResponse = json.decode(response.body);
      return Veterinary.fromJson(jsonResponse);
    }else{
      print('Get veterinary by id failed. Server returned status: ${response.statusCode}');
      return null;
    }
  }
  //Put
  Future<bool> updateVeterinaryProfile(UpdateVet updateVeterinary) async{
    http.Response response = await http.patch(
      Uri.parse("$baseUrl/Veterinary/${updateVeterinary.id}"),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',},
      body: jsonEncode(updateVeterinary.toMap()),
    );
    if(response.statusCode == HttpStatus.ok){
      print('Si actualizo con exito');
      return true;
    }else{
      print('no se actualizo con exito');
      return false;
    }
  }
  //get all pets
  Future<List<Pet>?> getAllPets(int page, int size) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/Pet"));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final pets = <Pet>[];
      for (var item in jsonResponse) {
        pets.add(Pet.fromJson(item));
      }
      return pets;
    }
    return null;
  }
  //get all meetings
  Future<List<Meeting>?> getAllMeetings(int page, int size) async {
    http.Response response = await http.get(Uri.parse("$baseUrl/Meeting"));
    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      final meetings = <Meeting>[];
      for (var item in jsonResponse) {
        meetings.add(Meeting.fromJson(item));
      }
      return meetings;
    }
    return null;
  }

  //update Meeting
  Future<bool> updateMeeting(UpdateMeeting updateMeeting) async {
    http.Response response = await http.put(
      Uri.parse("$baseUrl/Meeting/${updateMeeting.id}"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(updateMeeting.toMap()),
    );
    if (response.statusCode == HttpStatus.ok) {
      print('Si actualizo con exito');
      return true;
    } else {
      print('no se actualizo con exito');
      return false;
    }
  }

}