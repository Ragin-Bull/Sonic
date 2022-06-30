import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/views/screens/homepage.dart';
import 'package:zoom_app/views/screens/widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //Initialise the authcontroller class that you set up in the auth_controller dart file
  final AuthController _authController = AuthController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Start or Join a Meeting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'assets/images/onit.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: 'Google Sign In',
                onPressed: () {
                  setState((){
                    _authController.signInWithGoogle();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                          return HomeScreen();
                        }));
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
