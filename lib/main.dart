import 'dart:io';

import 'package:class_tracker/src/scrrens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/common_widgets/button.dart';
import 'src/common_widgets/container_button.dart';
import 'src/scrrens/admin_screen/admin_dashboard.dart';
import 'src/scrrens/admin_screen/class/admin_class_dashboard.dart';
import 'src/scrrens/admin_screen/student/admin_student_dashboard.dart';
import 'src/scrrens/admin_screen/student/student_view.dart';
import 'src/scrrens/sign_in.dart';
import 'src/scrrens/studen_screen/teacher_details.dart';

// this is original complete code

// firebase initialize krala flutter project ekat plug kranawa
Future main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // Platform.isAndroid
  //     ? await Firebase.initializeApp(
  //         options: const FirebaseOptions(
  //             apiKey: "AIzaSyBUha4YHFQcu6yk3RKbrNc7sFmzeIcbPM0",
  //             appId: "1:41364954983:android:1b904d3b9242d9a14fd9c2",
  //             messagingSenderId: "41364954983",
  //             projectId: "class-tracker-flutter-firebase"))
  //     : await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Class Monitoring App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
          //HomePage()
          //LoginPage(),
          //TeacherDetailsPage(),
          //AdminScreen(),
          //ClassManagment(),
          StudentManagement(),
      //  StudentView(),
    );
  }
}


/*

// check the custom card 

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomContainer(
                title: "Container 1",
                imagePath: 'assets/images/11.jpg',
                fontColor: Colors.blue,
                bgColor: Colors.yellow,
                width: 150.0,
                height: 150.0,
                cornerRadius: 30.0,
                onTap: () {
                  // Handle click event here
                  // print("Container 1 Clicked!");
                },
              ),
              const SizedBox(height: 20.0),
              CustomContainer(
                title: "Container 2",
                imagePath: 'assets/images/22.jpg',
                
                fontColor: Colors.red,
                bgColor: Colors.green,
                width: 200.0,
                height: 100.0,
                cornerRadius: 20.0,
                onTap: () {
                  // Handle click event here
                  // print("Container 2 Clicked!");
                },
              ),
             const  SizedBox(height: 20.0),
              CustomContainer(
                title: "Container 3",
                imagePath: 'assets/images/33.jpg',
                fontColor: Colors.black,
                bgColor: Colors.orange,
                width: 120.0,
                height: 180.0,
                cornerRadius: 25.0,
                onTap: () {
                  // Handle click event here
                  // print("Container 3 Clicked!");
                },
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
*/


/*
// retrun the pages that we created
void main() {
  runApp(MyApp());
}

// ignore: use_key_in_widget_constructors
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      title: 'Class Monitoring App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:
     //HomePage()
     // LoginPage(),
      //TeacherDetailsPage(),
       AdminScreen(),
       
    );
  }
}
*/

/*

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp();
  }
}

*/

