import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  final String className;
  final String imagePath;

  ClassCard({Key? key, required this.className, required this.imagePath})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, // Align children to the top center
        children: [
          ListTile(
            title: Text(
              className,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                height: 18,
              ),
            ),
            onTap: () {
              // Handle class tap event
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 5.0), // Add space between Text and CircleAvatar
            child: CircleAvatar(
              radius: 25.0, // Adjust the size as needed
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ],
      ),
    );
  }
}
