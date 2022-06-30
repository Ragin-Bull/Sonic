import 'package:flutter/material.dart';
import 'package:zoom_app/utils/colors.dart';
import 'package:zoom_app/views/screens/history_screen.dart';
import 'package:zoom_app/views/screens/meeting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  List pages = [MeetingScreen(), HistoryScreen()]; //You'll see!!

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0,
          title: Text(
            'Meet and Talk',
            style: TextStyle(fontSize: 19),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (selectedIconIndex) {
            //THis selects the icon index by default
            setState(() {
              currentPageIndex = selectedIconIndex;
            });
          },
          currentIndex: currentPageIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.comment_bank),
              label: "Meet and Talk",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.lock_clock),
              label: "Meeting",
            ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.person_add_alt_outlined),
            //   label: "Contacts",
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings_outlined),
            //   label: "Settings",
            // ),
          ],
        ),
        body: pages[currentPageIndex], //Simple as fuck
      ),
    );
  }
}
