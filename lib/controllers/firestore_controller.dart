import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreController {
  //We'll store the meeting details in the firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create a stream to return the meeting data to the History Page
  Stream get meetingHistory => _firestore
      .collection('users')
      .doc(_auth.currentUser!.uid)
      .collection('meetings')
      .snapshots();

  void addMeetingToFirestore(String meetingName) async {
    try {
      //FInd the last collection and add the new meeting details
      await _firestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('meetings')
          .add({
        'meetingName': meetingName,
        'createdOn': DateTime.now(),
      });
    } catch (err) {}
  }
}
