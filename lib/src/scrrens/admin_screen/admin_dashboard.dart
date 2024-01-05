import 'package:flutter/material.dart';

import '../../common_widgets/container_button.dart';

// ignore: use_key_in_widget_constructors
class AdminScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hi Admin"),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "What are you going to do?",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            const SizedBox(height: 20.0),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  CustomContainer(
                    title: "Class Managment",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    cornerRadius: 25.0,
                    onTap: () {
                      // Handle click event here
                      // print("Container 3 Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "User Management",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    onTap: () {
                      // Handle click event
                      //print("User Management Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "Dashboard Overview",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    onTap: () {
                      // Handle click event
                      //print("Dashboard Overview Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "Calendar",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    onTap: () {
                      // Handle click event
                      //print("Calendar Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "Attendance Management",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    onTap: () {
                      // Handle click event
                      //print("Attendance Management Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "Message Center",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    onTap: () {
                      // Handle click event
                      //print("Message Center Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "System Setting",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
                    width: 120.0,
                    height: 120.0,
                    onTap: () {
                      // Handle click event
                      //print("System Setting Clicked!");
                    },
                  ),
                  CustomContainer(
                    title: "Report and Analytics",
                    imagePath: 'assets/images/11.jpg',
                    fontColor: Colors.black,
                    bgColor: Colors.orange,
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
          ],
        ),
      ),
    );
  }
}
