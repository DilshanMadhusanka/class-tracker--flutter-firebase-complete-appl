import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StudentListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student List', style: TextStyle(color: Colors.white)),
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
              future: studentsCount(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text(
                  'Number of Students: ${snapshot.data ?? 0}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                );
              },
            ),
          ),
          Expanded(
            child: StudentList(),
          ),
        ],
      ),
    );
  }

  Future<int> studentsCount() async {
    var snapshot = await FirebaseFirestore.instance.collection('students').get();
    return snapshot.size;
  }
}

class StudentList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('students').snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }

        var students = snapshot.data?.docs ?? [];

        return ListView.builder(
          itemCount: students.length,
          itemBuilder: (context, index) {
            var studentData = students[index].data();
            if (studentData == null) {
              return Container(); // Return an empty container if data is null.
            }

            var student = studentData as Map<String, dynamic>;
            var firstName = student['firstName'] as String?;
            var lastName = student['lastName'] as String?;
            var mobileNumber = student['mobileNumber'] as String?;
            var email = student['email'] as String?;

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