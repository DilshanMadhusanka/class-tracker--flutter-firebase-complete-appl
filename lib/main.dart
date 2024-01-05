import 'package:class_tracker/src/scrrens/home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/common_widgets/button.dart';
import 'src/common_widgets/container_button.dart';
import 'src/scrrens/admin_screen/admin_dashboard.dart';
import 'src/scrrens/home.dart';
import 'src/scrrens/sign_in.dart';
import 'src/scrrens/studen_screen/teacher_details.dart';

/*
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
     // HomePage()
      //LoginPage()
      //TeacherDetailsPage(),
   AdminScreen(),
    );
  }
}



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








/*


// this is original complete code

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialized the firebase
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp( 

    
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Class Tracker'),
        ),
        body: Column(
          children: [
            // Apply the custom button
            
            CustomButton(
              textColor: Colors.black,
              backgroundColor: Colors.blue,
              borderColor: Colors.white,
              text: "Click me",
              width: 150.0,
              height: 50.0,
              onTap: () {
                // Your click event logic here
               
              },
            ),
          ],
        ),
      ),
    );
  }
}
*/