import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:veterinariesapp/screens/signup_vet.dart';

class LoginVet extends StatefulWidget {
  const LoginVet({super.key});

  @override
  State<LoginVet> createState() => _LoginVetState();
}

class _LoginVetState extends State<LoginVet> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  void perforLogin() {
    String username = usernameController.text;
    String password = passwordController.text;

    print('Username: $username');
    print('Password: $password');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Back'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Text(
              'Welcome to PawPoint! 🐶',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Space Grotesk',
                fontWeight: FontWeight.w700,
                height: 1.8,
                letterSpacing: -0.24,
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
                      labelText: 'User Name',
                      border: OutlineInputBorder(),
                      hintText: 'Jhon Don',
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
                 padding: const EdgeInsets.only(top: 80,left: 50,right: 50,bottom: 50),
                 child: GestureDetector(
                  onTap: () {
                    perforLogin();
                  },
                   child: Container(
                            width: 380,
                            height: 50,
                            padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 17),
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
                               'Sign In',
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

                Padding(
                  padding: const EdgeInsets.only(left: 50,right: 50),
                  child: Text.rich(
                  TextSpan(
                      children: [
                          TextSpan(
                              text: 'Don’t  have an account?',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.699999988079071),
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                              ),
                          ),
                          const TextSpan(
                              text: ' ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                              ),
                          ),
                           TextSpan(
                              text: 'Sign Up',
                              style:  const TextStyle(
                                  color: Colors.cyan,
                                  fontSize: 14,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  height: 0.09,
                              ),
                              recognizer: 
                              TapGestureRecognizer()..onTap= (){
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>const SignupVet()));
                                } 
                              
                          ),  

                      ],
                  ),
                  
                
                  ),
                )
         
          ],
        ),
      ),
    );
  }
}
