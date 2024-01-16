import 'package:class_tracker/src/common_widgets/admin_card.dart';
import 'package:class_tracker/src/scrrens/admin_screen/class/admin_class_dashboard.dart';
import 'package:class_tracker/src/scrrens/admin_screen/mark_attendance.dart';
import 'package:class_tracker/src/scrrens/admin_screen/student/admin_student_dashboard.dart';
import 'package:class_tracker/src/scrrens/class_shedule_screen.dart';
import 'package:class_tracker/src/scrrens/student_list.dart';
import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Admin Dashboard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.white, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What are you going to do?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  children: [
                    AdminCard(
                      title: "Class Managment",
                      imagePath: 'assets/images/25.jpg',
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      cornerRadius: 25.0,
                      onTap: () {
                        // Navigate to ClassManagment screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassManagment()),
                        );
                        // Handle click event here
                        // print("Container 3 Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "Student Management",
                      imagePath: 'assets/images/15.jpg',
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentManagement()),
                        );
                        // Handle click event
                        //print("User Management Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "Teacher Management",
                      imagePath: 'assets/images/22.jpg',
                      fontColor: Color.fromARGB(255, 255, 255, 255),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        // Handle click event
                        //print("Dashboard Overview Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "Attendance Management",
                      imagePath: 'assets/images/23.png',
                      fontColor: const Color.fromARGB(255, 255, 247, 247),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AttendanceScreen()),
                        );
                        // Handle click event
                        //print("Attendance Management Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "Student List",
                      imagePath: 'assets/images/19.png',
                      fontColor: const Color.fromARGB(255, 255, 254, 254),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StudentListScreen()),
                        );
                        // Handle click event
                        //print("Calendar Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "Class Shedule",
                      imagePath: 'assets/images/21.png',
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ClassScheduleScreen()),
                        );
                        // Handle click event
                        //print("Message Center Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "System Setting",
                      imagePath: 'assets/images/24.png',
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        // Handle click event
                        //print("System Setting Clicked!");
                      },
                    ),
                    AdminCard(
                      title: "Report and Analytics",
                      imagePath: 'assets/images/21.png',
                      fontColor: const Color.fromARGB(255, 255, 255, 255),
                      bgColor: Colors.blue,
                      width: 120.0,
                      height: 120.0,
                      onTap: () {
                        // Handle click event
                        //print("Report and Analytics Clicked!");
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
