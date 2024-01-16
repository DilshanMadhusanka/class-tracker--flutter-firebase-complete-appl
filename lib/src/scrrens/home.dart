import 'package:flutter/material.dart';
import '../common_widgets/class_card.dart';
import '../common_widgets/container_button.dart';

// ignore: use_key_in_widget_constructors
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Class Monitor'),
      ),
      backgroundColor: Colors.white,
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
          const SizedBox(height: 30.0),
          const Text(
            'WELCOME TO EDUCATIONIST ',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5.0),
          // const Text(
          //   'Stay updated with your classes',
          //   style: TextStyle(
          //     fontSize: 18.0,
          //     color: Colors.green,
          //   ),
          // ),
          const Text(
            'Digitalizing scholastic institutions to survive in this Internet era with a myraid of benifits to excel in academic as well as management.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.normal,
                color: Color.fromARGB(255, 124, 124, 124)),
          ),
          const SizedBox(height: 8.0),
        ],
      ),
    );
  }

  Widget _buildClassDetails() {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'ABOUT US',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          CustomContainer(
            title:
                "Life has a unique way of presenting us with hurdles and obstacles, but it is precisely these challenges that mold us into stronger, more resilient individuals. Don't be afraid of challenges; embrace them, for they are the stepping stones to success.",
            imagePath: 'assets/images/444.png',
            fontColor: Colors.black,
            bgColor: Colors.greenAccent,
            width: 410.0,
            height: 300.0,
            cornerRadius: 25.0,
            onTap: () {
              // Handle click event here
              // print("Container 3 Clicked!");
            },
          ),
          // ClassCard(className: 'Combine Maths', imagePath: 'assets/images/14.jpg'),
          const SizedBox(height: 8.0),
          CustomContainer(
            title:
                "Surround yourself with positivity, with people who uplift and inspire you. Remember that success is often a collaborative effort, and those who encourage you during your journey are invaluable. Build a support system that empowers you to reach new heights.",
            imagePath: 'assets/images/222.jpg',
            fontColor: Colors.white,
            bgColor: Colors.blue,
            width: 410.0,
            height: 300.0,
            cornerRadius: 25.0,
            onTap: () {
              // Handle click event here
              // print("Container 3 Clicked!");
            },
          ),
          //ClassCard(className: 'Chemistry', imagePath: 'assets/images/12.png'),
          const SizedBox(height: 8.0),
          CustomContainer(
            title:
                "Take risks, for it is in those moments of uncertainty that we discover our true capabilities. Don't be afraid to step out of your comfort zone, for that's where magic happens. Growth lies in the willingness to face the unknown and to challenge the status quo.",
            imagePath: 'assets/images/333.png',
            fontColor: Colors.white,
            bgColor: Color.fromARGB(255, 26, 221, 149),
            width: 410.0,
            height: 300.0,
            cornerRadius: 25.0,
            onTap: () {
              // Handle click event here
              // print("Container 3 Clicked!");
            },
          ),
          //ClassCard(className: 'Physics', imagePath: 'assets/images/13.jpg'),
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
        style: ElevatedButton.styleFrom(
          primary: Colors.blue, // Background color
          onPrimary: Colors.white, // Text color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0), // Rounded corners
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0), // Padding
        ),
        child: Text(
          'Sign In',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

/*
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

  */
}
