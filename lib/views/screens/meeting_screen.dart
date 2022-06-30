import 'dart:math';

import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/jitsiMeet_controller.dart';
import 'package:zoom_app/views/screens/video_call_screen.dart';
import 'package:zoom_app/views/screens/widgets/reusable_icon.dart';

class MeetingScreen extends StatefulWidget {
  @override
  State<MeetingScreen> createState() => _MeetingScreenState();
}

class _MeetingScreenState extends State<MeetingScreen> {
  //This function generates a new meeting
  createNewMeeting() {
    var random = Random();
    var roomName = (random.nextInt(10000000) + 10000000).toString();
    // String roomName = "Room No. " + randomRoomID;
    final JitsiMeetContoller _jitsiController = JitsiMeetContoller();
    _jitsiController.createMeeting(
        roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => VideoCallScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 4.0,
              vertical: 16.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ReuseAbleIcon(
                  icon: Icons.videocam,
                  text: 'New Meeting',
                  onPressed: () {
                    setState(() {
                      createNewMeeting();
                    });
                  },
                ),
                ReuseAbleIcon(
                  icon: Icons.add_box_rounded,
                  text: 'Join Meeting',
                  onPressed: () {
                    setState(() {
                      joinMeeting();
                    });
                  },
                ),
                ReuseAbleIcon(
                  icon: Icons.calendar_today_rounded,
                  text: 'Schedule',
                  onPressed: () {},
                ),
                ReuseAbleIcon(
                  icon: Icons.arrow_circle_up_rounded,
                  text: 'Share Screen',
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Create/Join Meetings with just a tap',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
            ),
          )
        ],
      ),
    );
  }
}
