// student_dashboard.dart
import 'package:flutter/material.dart';
import 'package:class_tracker/src/data/models/student.dart';

class StudentDashboard extends StatelessWidget {
  final StudentModel student;

  StudentDashboard(this.student);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${student.firstName} ${student.lastName}!'),
            Text('Email: ${student.email}'),
            Text('Mobile Number: ${student.mobileNumber}'),
            Text('Parent Name: ${student.parentName}'),
            Text('Parent NIC: ${student.parentNIC}'),
            Text('Parent Mobile Number: ${student.parentMobileNumber}'),
          ],
        ),
      ),
    );
  }
}
