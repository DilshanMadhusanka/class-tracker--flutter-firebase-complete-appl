import 'package:class_tracker/src/data/models/teacher.dart';
import 'package:class_tracker/src/data/remort_data_source/teacher_firebase_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/models/student.dart';
import '../../../data/remort_data_source/student_firebase_helper.dart';
import 'edit_teacher.dart';

class TeacherManagement extends StatefulWidget {
  const TeacherManagement({Key? key}) : super(key: key);

  @override
  State<TeacherManagement> createState() => _TeacherManagementState();
}

class _TeacherManagementState extends State<TeacherManagement> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();

  TextEditingController _NICController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();

    _NICController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Teacher-Management",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "First Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Last Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _mobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Mobile Number",
                ),
              ),

              const SizedBox(height: 10),
              TextFormField(
                controller: _NICController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "NIC",
                ),
              ),

              const SizedBox(height: 10),

              InkWell(
                onTap: () {
                  FirestoreHelperTeacher.createTeacher(TeacherModel(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    email: _emailController.text,
                    mobileNumber: _mobileNumberController.text,
                    NIC: _NICController.text,
                  ));
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
              ),
              const SizedBox(height: 10),

              // create a list view

              StreamBuilder<List<TeacherModel>>(
                  stream: FirestoreHelperTeacher.readTeachers(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text("Some error occurred"),
                      );
                    }

                    if (snapshot.hasData) {
                      final teacherData = snapshot.data;
                      return Expanded(
                        child: ListView.builder(
                          itemCount: teacherData!.length,
                          itemBuilder: (context, index) {
                            final singleTeacher = teacherData[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                onLongPress: () {
                                  showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: const Text("Delete"),
                                        content: const Text(
                                            "Are you sure you want to delete"),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              FirestoreHelperTeacher
                                                  .deleteTeacher(
                                                singleTeacher,
                                              ).then((value) {
                                                Navigator.pop(context);
                                              });
                                            },
                                            child: Text("Delete"),
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                leading: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: const BoxDecoration(
                                    color: Colors.lightBlue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                title: Text(
                                    "${singleTeacher.firstName} ${singleTeacher.lastName}"),
                                subtitle: Text("${singleTeacher.email}"),
                                trailing: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditTeacher(
                                                    teacher: TeacherModel(
                                                      id: singleTeacher.id,
                                                      firstName: singleTeacher
                                                          .firstName,
                                                      lastName: singleTeacher
                                                          .lastName,
                                                      email:
                                                          singleTeacher.email,
                                                      mobileNumber:
                                                          singleTeacher
                                                              .mobileNumber,
                                                      NIC: singleTeacher.NIC,
                                                    ),
                                                  )));
                                    },
                                    child: Icon(Icons.edit)),
                              ),
                            );
                          },
                        ),
                      );
                    }

                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  })
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