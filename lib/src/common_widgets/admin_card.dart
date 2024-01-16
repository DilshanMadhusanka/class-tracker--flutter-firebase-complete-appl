import 'package:flutter/material.dart';

class AdminCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color fontColor;
  final Color bgColor;
  final double width;
  final double height;
  final double cornerRadius;
  final Function()? onTap;

  // ignore: prefer_const_constructors_in_immutables, use_key_in_widget_constructors
  AdminCard({
    required this.title,
    required this.imagePath,
    this.fontColor = Colors.black,
    this.bgColor = Colors.white,
    required this.width,
    required this.height,
    this.cornerRadius = 20.0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: 200,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(cornerRadius),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(cornerRadius),
                child: Image.asset(
                  imagePath,
                  width: 70, // Set your desired image width
                  height: 70, // Set your desired image height
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: fontColor,
                  fontSize: 16.0,
                  // Set your desired font size
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// how to use

/*
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
          */