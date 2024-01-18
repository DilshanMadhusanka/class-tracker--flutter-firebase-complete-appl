import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher List', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: FutureBuilder<int>(
              future: teachersCount(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text(
                  'Number of Teachers: ${snapshot.data ?? 0}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          Expanded(
            child: TeacherList(),
          ),
        ],
      ),
    );
  }

  Future<int> teachersCount() async {
    var snapshot = await FirebaseFirestore.instance.collection('teacher').get();
    return snapshot.size;
  }
}

class TeacherList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('teacher').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var teachers = snapshot.data?.docs ?? [];

        return ListView.builder(
          itemCount: teachers.length,
          itemBuilder: (context, index) {
            var teacherData = teachers[index].data();
            if (teacherData == null) {
              return Container(); // Return an empty container if data is null.
            }

            var teacher = teacherData as Map<String, dynamic>;
            var firstName = teacher['firstName'] as String?;
            var lastName = teacher['lastName'] as String?;
            var mobileNumber = teacher['mobileNumber'] as String?;
            var email = teacher['email'] as String?;

            var fullName = '${firstName ?? 'N/A'} ${lastName ?? ''}';

            return Container(
              margin: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 2.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: ListTile(
                title: Text(fullName),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Mobile: ${mobileNumber ?? 'N/A'}'),
                    Text('Email: ${email ?? 'N/A'}'),
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