// teacher_dashboard.dart
import 'package:flutter/material.dart';
import 'package:class_tracker/src/data/models/teacher.dart';

class TeacherDashboard extends StatelessWidget {
  final TeacherModel teacher;

  TeacherDashboard(this.teacher);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome, ${teacher.firstName} ${teacher.lastName}!'),
            Text('Email: ${teacher.email}'),
            Text('Mobile Number: ${teacher.mobileNumber}'),
            Text('NIC: ${teacher.NIC}'),
          ],
        ),
      ),
    );
  }
}
