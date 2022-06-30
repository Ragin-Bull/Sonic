import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/auth_controller.dart';
import 'package:zoom_app/controllers/jitsiMeet_controller.dart';
import 'package:zoom_app/utils/colors.dart';

class VideoCallScreen extends StatefulWidget {
  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  //To display the by default username a thing we implemented in the chat app
  late TextEditingController meetingIDController;

  late TextEditingController nameController;

  //Instatiate it to get the current user
  final AuthController _authController = AuthController();

  //To access the Meeting Thing
  final JitsiMeetContoller _jitsiMeetContoller = JitsiMeetContoller();
  bool numberForAudio = false;
  bool numberForVideo = false;

  void initState() {
    //We want to gain the access to the logged in username and room no everytime the screen starts
    super.initState();
    meetingIDController = TextEditingController();
    nameController =
        TextEditingController(text: _authController.user?.displayName);
  }

  _joinMeeting() {
    _jitsiMeetContoller.createMeeting(
      roomName: meetingIDController.text,
      isAudioMuted: !numberForAudio,
      isVideoMuted: !numberForVideo,
      username: nameController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
          centerTitle: true,
          title: Text(
            'Join a Meeting',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: meetingIDController,
                keyboardType: TextInputType.number,
                maxLines: 1,
                decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "6-Digit Meeting Room Id",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: nameController,
                keyboardType: TextInputType.name,
                maxLines: 1,
                decoration: InputDecoration(
                  fillColor: secondaryBackgroundColor,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Username",
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(buttonColor),
              ),
              onPressed: () {
                setState(() {
                  _joinMeeting();
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Join',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        numberForAudio ? buttonColor : backgroundColor),
                  ),
                  onPressed: () {
                    setState(() {
                      numberForAudio = !numberForAudio;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      numberForAudio ? 'Audio turned ON' : 'Audio turned OFF',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        numberForVideo ? buttonColor : backgroundColor),
                  ),
                  onPressed: () {
                    setState(() {
                      numberForVideo = !numberForVideo;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      numberForVideo ? 'Video turned ON' : 'Video turned OFF',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
