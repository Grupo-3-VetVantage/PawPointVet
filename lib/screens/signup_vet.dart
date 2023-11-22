import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veterinariesapp/model/veterinarysignup_model.dart';
import 'package:veterinariesapp/screens/login_vet.dart';
import 'package:veterinariesapp/services/veterinary_service.dart';

class SignupVet extends StatefulWidget {
  const SignupVet({super.key});

  @override
  State<SignupVet> createState() => _SignupVetState();
}

class _SignupVetState extends State<SignupVet> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  bool isPasswordVisible = false;
  VeterinaryService? _vetService;
  
  @override
  void initState() {
    _vetService = VeterinaryService();
    super.initState();
  }

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }
  

   Future<void> performSignup() async {
    BuildContext currentContext = context;
    String name = nameController.text;
    String password = passwordController.text;
    String email = emailController.text;
    String username = usernameController.text;

    // Validate fields before making the signup request
    if (name.isEmpty || password.isEmpty || email.isEmpty || username.isEmpty) {
      // Show an error message or do something to handle the empty fields
      return;
    }

    // Create a VeterinarySignup object
    VeterinarySignup veterinarySignup = VeterinarySignup(
      email: email,
      password: password,
      name: name,
      username: username,
    );

    // Make the signup request
    VeterinarySignup? result = await _vetService?.signup(veterinarySignup);

    // Check the result and navigate to the home screen if successful
  
    Navigator.push( context,MaterialPageRoute(builder: (context) => LoginVet()));
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Padding(  
              padding: const EdgeInsets.only(top: 50),
              child: Column(
                children: [
                  const Text(
                    'Create account 🐶',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontFamily: 'Space Grotesk',
                      fontWeight: FontWeight.w700,
                      height: 1.8,
                      letterSpacing: -0.24,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      'Please fill your details',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFFA1A1A1),
                          fontSize: 16,
                          fontFamily: 'SF Pro Text',
                          fontWeight: FontWeight.w400,
                          height: 0.09,
                      ),
                      ),
                  ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50,left: 50,right: 50 ),
                      child: SizedBox(
                        width: 380,
                        height: 50,
                        child: TextField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            labelText: 'Name',
                            border: OutlineInputBorder(),
                            hintText: 'Jhon Don',
                          ),
                        ),
                      ),
                    ),
          
                    Padding(
                      padding: const EdgeInsets.only(top: 50,left: 50,right: 50 ),
                      child: SizedBox(
                        width: 380,
                        height: 50,
                        child: TextField(
                          controller: emailController,
                          decoration: const InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            hintText: 'example@email.com',
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 50,left: 50,right: 50 ),
                      child: SizedBox(
                        width: 380,
                        height: 50,
                        child: TextField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            labelText: 'Username',
                            border: OutlineInputBorder(),
                            hintText: 'JuanP',
                          ),
                        ),
                      ),
                    ),
                 
                  
                     Padding(
                       padding: const EdgeInsets.only(top: 40,left: 50,right: 50),
                       child: SizedBox(
                        width: 382,
                        height: 50,
                        child: TextField(
                          controller: passwordController,
                          decoration:  InputDecoration(
                            labelText: 'Password',
                            suffixIcon: IconButton(
                                icon: isPasswordVisible
                                  ? const Icon(Icons.visibility)
                                  : const Icon(Icons.visibility_off),
                              onPressed: togglePasswordVisibility,
                            ),
                            border: const OutlineInputBorder(),
                            hintText: 'Enter your password',
                          ),
                          obscureText: !isPasswordVisible,
                        ),
                                   ),
                     ),
                      
                     
          
                      Padding(
                    padding: const EdgeInsets.only(top: 40, left: 30, right: 30, bottom: 25),
                    child: GestureDetector(
                      onTap: performSignup, // Call the signup function on button tap
                      child: Container(
                        width: 390,
                        height: 50,
                        padding: const EdgeInsets.symmetric(horizontal: 108, vertical: 17),
                        decoration: ShapeDecoration(
                          color: Colors.cyan,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Create Account',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0.08,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

               
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}