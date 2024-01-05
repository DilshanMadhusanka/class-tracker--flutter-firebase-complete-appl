import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class TeacherDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TeacherDetailsBody(),
      ),
    );
  }
}

// ignore: use_key_in_widget_constructors
class TeacherDetailsBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 50.0),
         const Text(
            'Teacher Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(height: 16.0),
          Expanded(
            child: Container(
              decoration:const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const  SizedBox(height: 16.0),
                  _buildTeacherButtons(context),
                 const SizedBox(height: 16.0),
                  _buildBackButton(context),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeacherButtons(BuildContext context) {
    return Column(
      children: [
        _buildTeacherButton(context, 'Combine Maths'),
      const  SizedBox(height: 8.0),
        _buildTeacherButton(context, 'Physics'),
       const SizedBox(height: 8.0),
        _buildTeacherButton(context, 'Chemistry'),
      ],
    );
  }

  Widget _buildTeacherButton(BuildContext context, String subject) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 32,
      child: ElevatedButton(
        onPressed: () {
          // Handle button press, navigate to another page
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[900],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            subject,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        // Handle back button press
        Navigator.pop(context);
      },
      icon:const Icon(Icons.arrow_back, color: Colors.white),
      label:const Text('Back', style: TextStyle(color: Colors.white)),
    );
  }
}
