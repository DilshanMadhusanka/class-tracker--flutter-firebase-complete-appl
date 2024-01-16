import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../data/models/student.dart';
import '../../../data/remort_data_source/student_firebase_helper.dart';
import 'edit_student.dart';
//import 'student_view.dart';

class StudentManagement extends StatefulWidget {
  const StudentManagement({Key? key}) : super(key: key);

  @override
  State<StudentManagement> createState() => _StudentManagementState();
}

class _StudentManagementState extends State<StudentManagement> {
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileNumberController = TextEditingController();
  TextEditingController _parentNameController = TextEditingController();
  TextEditingController _parentNICController = TextEditingController();
  TextEditingController _parentMobileController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _mobileNumberController.dispose();
    _parentNameController.dispose();
    _parentNICController.dispose();
    _parentMobileController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text(
            "Student-Management",
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
                controller: _parentNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parent Name",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _parentNICController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parent NIC",
                ),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _parentMobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parent Mobile Number",
                ),
              ),
              const SizedBox(height: 10),

              InkWell(
                onTap: () {
                  FirestoreHelperStudent.createStudent(StudentModel(
                    firstName: _firstNameController.text,
                    lastName: _lastNameController.text,
                    email: _emailController.text,
                    mobileNumber: _mobileNumberController.text,
                    parentName: _parentNameController.text,
                    parentNIC: _parentNICController.text,
                    parentMobileNumber: _parentMobileController.text,
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




              StreamBuilder<List<StudentModel>>(
                stream: FirestoreHelperStudent.readStudents(),
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
                    final studentData = snapshot.data;
                    return Expanded(
                      child: ListView.builder(
                        itemCount: studentData!.length,
                        itemBuilder: (context, index) {
                          final singleStudent = studentData[index];
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
                                            FirestoreHelperStudent.deleteStudent(
                                              singleStudent,
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
                                decoration:const BoxDecoration(
                                  color: Colors.lightBlue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              title: Text("${singleStudent.firstName} ${singleStudent.lastName}"),
                              subtitle: Text("${singleStudent.email}"),
                              trailing: InkWell(
                                onTap:() {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => EditStudent(
                                          student: StudentModel(
                                            id: singleStudent.id,
                                            firstName: singleStudent.firstName,
                                            lastName: singleStudent.lastName,
                                            email: singleStudent.email,
                                            mobileNumber: singleStudent.mobileNumber,
                                            parentName: singleStudent.parentName,
                                            parentNIC: singleStudent.parentNIC,
                                            parentMobileNumber: singleStudent.parentMobileNumber,
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
