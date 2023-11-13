import 'dart:io';
import 'dart:convert';
import 'package:veterinariesapp/model/veterinaryLogin_model.dart';
import 'package:http/http.dart' as http;
import 'package:veterinariesapp/model/veterinary_model.dart';
import 'package:veterinariesapp/model/veterinarysignup_model.dart';
class VeterinaryService{
  final baseUrl = 'https://vetvantageapp.azurewebsites.net/api';

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
  Future<VeterinaryLogin?> login(VeterinaryLogin veterinaryLogin) async {
    http.Response response = await http.post(Uri.parse("$baseUrl/Veterinary/Login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(veterinaryLogin.toMap()));

    if (response.statusCode == HttpStatus.ok) {
      final jsonResponse = json.decode(response.body);
      return VeterinaryLogin.fromJson(jsonResponse);
    }

    return null;
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



  
  
}