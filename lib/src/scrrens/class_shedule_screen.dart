import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ClassScheduleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Class Schedule', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ClassScheduleList(),
    );
  }
}

class ClassScheduleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('classes').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var classSchedule = snapshot.data?.docs ?? [];

        return ListView.builder(
          itemCount: classSchedule.length,
          itemBuilder: (context, index) {
            var scheduleData = classSchedule[index].data();
            if (scheduleData == null) {
              return Container(); // Return an empty container if data is null.
            }

            var schedule = scheduleData as Map<String, dynamic>;
            var subject = schedule['subject'] as String?;
            var teacherName = schedule['teacherName'] as String?;
            var location = schedule['location'] as String?;

            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(subject ?? 'N/A'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Teacher: ${teacherName ?? 'N/A'}'),
                    Text('Location: ${location ?? 'N/A'}'),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}