import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  final String className;
  final String imagePath;

  // ignore: prefer_const_constructors_in_immutables
  ClassCard({super.key, required this.className, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: ListTile(
        title: Text(
          className,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: CircleAvatar(
          backgroundImage: AssetImage(imagePath),
        ),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () {
          // Handle class tap event
        },
      ),
    );
  }
}
