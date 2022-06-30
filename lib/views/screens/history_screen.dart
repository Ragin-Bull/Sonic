import 'package:flutter/material.dart';
import 'package:zoom_app/controllers/firestore_controller.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirestoreController().meetingHistory, //The Stream
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(
              child: CircularProgressIndicator(),
            );
          return ListView.builder(
            itemCount: (snapshot.data! as dynamic).docs.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                        'Room Name: ${(snapshot.data! as dynamic).docs[index]['meetingName']}'),
                    subtitle: Text(
                        'Joined on ${DateFormat.yMMMd().format((snapshot.data! as dynamic).docs[index]['createdOn'])}'),
                  ));
        });
  }
}
