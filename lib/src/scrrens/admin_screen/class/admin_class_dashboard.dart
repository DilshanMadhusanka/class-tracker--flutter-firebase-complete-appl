import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/models/class_model.dart';
import '../../../data/remort_data_source/firestore_helper.dart';

class ClassManagment extends StatefulWidget {
  const ClassManagment({Key? key}) : super(key: key);

  @override
  State<ClassManagment> createState() => _ClassManagmentState();
  //_ClassManagmentState createState() => _ClassManagmentState();
}

class _ClassManagmentState extends State<ClassManagment> {
  // create controllers
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _teacherNameController = TextEditingController();
  TextEditingController _locationController = TextEditingController();

  @override
  void dispose() {
    _subjectController.dispose();
    _teacherNameController.dispose();
    _locationController.dispose();
    super.dispose();
  }

  // Your state implementation goes here

  @override
  Widget build(BuildContext context) {
    // Your widget build method goes here
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text("Class-Management"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _subjectController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "subject name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _teacherNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "teacher name"),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _locationController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "location"),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  //print("create data");
                  //_create();

                  FirestoreHelper.create(ClassModel(
                      subject: _subjectController.text,
                      teachername: _teacherNameController.text,
                      location: _locationController.text));
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "Create",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
                // Your widget body goes here
              ),
            ],
          ),
        ),
      ),
    );
  }

/* 
// issellam hadankot mehema denna puluwan. code eken data bse eka hadnkot uda hadpu controllers use kranna 

    await docRef.set({
      "classname": "Maths",
       "location": "abc",
        "age": 23});
  }

  */
}
