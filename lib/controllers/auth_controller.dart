import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController {
  //Enable both FirebaseAuth and Firestore (for storing the user details) first
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //THis line is to save the user after he logs in once. So we are saving the status of the user in the variable
  Stream<User?> get authChanges => _auth.authStateChanges();

  //Get the details of the current user
  User? get user => _auth.currentUser;

  signInWithGoogle() async {
    //This line will sign in the user to the app
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //Check if the User gave the permission for Signing In or not
    //LOL this line clearly says it read it out to know..
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    //Now this callback will access the user credentials provided in by the user
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    //Here we store the data in firebase
    UserCredential userCredential =
        await _auth.signInWithCredential(credential);

    User? user = userCredential.user; //Initialise the User variable

    if (user != null) {
      //We check if the user is already signed in
      if (userCredential.additionalUserInfo!.isNewUser) {
        //Store all the info about the user
        //Also Note that 'users' is the name of the database you have set in firestore
        //As earlier we had discussed we need to store the name, uid (for unique user thing) and photo
        _firestore.collection('users').add({ //Use .add instead of .doc(uid).set()
          'username': user.displayName,
          'uid': user.uid,
          'profilePhoto': user.photoURL,
        });
      }
    }
  }
}
