import 'package:flutter/material.dart';
import 'package:veterinariesapp/screens/login_vet.dart';
import 'package:veterinariesapp/screens/signup_vet.dart';

class HomeVet extends StatefulWidget {
  const HomeVet({super.key});

  @override
  State<HomeVet> createState() => _HomeVetState();
}

class _HomeVetState extends State<HomeVet> {
  @override
  Widget build(BuildContext context) {
    const image = NetworkImage(
        "https://cdn.discordapp.com/attachments/1154594922339516427/1166830167298162799/powPB_1.png?ex=654bea46&is=65397546&hm=c45b3478941fb322be045b80c798c1c230ccf252c7fd846749435ba27651f0d0&");
    const image2 = NetworkImage(
        "https://cdn.discordapp.com/attachments/1154594922339516427/1166830279386738718/Fotografia.png?ex=654bea61&is=65397561&hm=0dc040ad790ddd8b5858cea3fc5f2a641a0bb614782e60bf08809786ef5cb4c1&");
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            const Image(image: image),
            const Image(image: image2),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginVet()));
                },
                child: Container(
                  width: 280,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 102, vertical: 17),
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
              padding: const EdgeInsets.all(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignupVet()));
                },
                child: Container(
                  width: 280,
                  height: 50,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 102, vertical: 17),
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
                        'Register',
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
    ));
  }
}
