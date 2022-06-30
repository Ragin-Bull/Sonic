import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/homepage.dart';
import '/views/screens/loginpage.dart';
import '/utils/colors.dart';

Future main() async {
  //Initialize the Firebase Server
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: StreamBuilder(
        stream: AuthController().authChanges,
        //snapShot has all the data of firebase
        builder: (context, snapShot) {
          if (snapShot.connectionState == ConnectionState.waiting)
            return Center(
              //If you dont have the user data then show the circular progress indicator
              child: CircularProgressIndicator(),
            );

          if (snapShot.hasData)
            //If we have the data then proceed to the next screen
            return HomeScreen();
          else
            //Just return the Login STate back if you have any other error
            return LoginScreen();
        },
      ),
    );
  }
}
