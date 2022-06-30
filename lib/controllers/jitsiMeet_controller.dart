import 'package:flutter/services.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/controllers/firestore_controller.dart';

class JitsiMeetContoller {
  //We are doing this to store the meeting details
  final FirestoreController _firestoreController = FirestoreController();

  //Now here we want to display the name and username of the user in the video calling app
  //We create an instance of the auth controller class
  final AuthController _authController = AuthController();

  createMeeting(
      {required String roomName,
      required bool isAudioMuted,
      required bool isVideoMuted,
      String username = ''}) async {
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      featureFlag.resolution = FeatureFlagVideoResolution
          .MD_RESOLUTION; // Limit video resolution to 360p
      String? name;
      if (username.isEmpty) {
        name = _authController.user?.displayName;
      } else {
        name = username;
      }
      var options = JitsiMeetingOptions(room: roomName)
        ..userDisplayName = name
        ..userEmail = _authController.user!.email
        ..userAvatarURL = _authController.user!.photoURL // or .png
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted;

      _firestoreController.addMeetingToFirestore(roomName);
      await JitsiMeet.joinMeeting(options);
    } catch (error) {
      print('ERRORRRR!!!');
    }
  }
}
