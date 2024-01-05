import 'package:flutter/material.dart';
import '../common_widgets/class_card.dart';


// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Class Monitor'),
      ),
       backgroundColor:  Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildHeader(),
            _buildClassDetails(),
            _buildSignInButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
    
      padding: const EdgeInsets.all(16.0),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/11.jpg', // Change this to your image asset
            height: 200,
          ),
         const SizedBox(height: 16.0),
          const Text(
            'Welcome to Class Monitoring App',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(height: 8.0),
         const Text(
            'Stay updated with your classes',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClassDetails() {
    return Container(
      padding:const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text(
            'Classes',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
         const SizedBox(height: 12.0),
          ClassCard(className: 'Combine Maths', imagePath: 'assets/images/14.jpg'),
         const SizedBox(height: 8.0),
          ClassCard(className: 'Chemistry', imagePath: 'assets/images/12.png'),
         const SizedBox(height: 8.0),
          ClassCard(className: 'Physics', imagePath: 'assets/images/13.jpg'),
        ],
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {
          // Handle sign-in button press
        },
        child: const Text('Sign In'),
      ),
    );
  }
}
