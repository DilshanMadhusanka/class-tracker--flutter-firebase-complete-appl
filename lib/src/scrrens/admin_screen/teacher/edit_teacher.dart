import 'package:class_tracker/src/data/models/student.dart'; // Import your StudentModel
import 'package:class_tracker/src/data/models/teacher.dart';
import 'package:class_tracker/src/data/remort_data_source/teacher_firebase_helper.dart';
import 'package:flutter/material.dart';
import '../../../data/remort_data_source/student_firebase_helper.dart';

class EditTeacher extends StatefulWidget {
  final TeacherModel teacher;
  const EditTeacher({Key? key, required this.teacher}) : super(key: key);

  @override
  _EditTeacherState createState() => _EditTeacherState();
}

class _EditTeacherState extends State<EditTeacher> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _emailController;
  TextEditingController? _mobileNumberController;

  TextEditingController? _NICController;

  @override
  void initState() {
    _firstNameController =
        TextEditingController(text: widget.teacher.firstName);
    _lastNameController = TextEditingController(text: widget.teacher.lastName);
    _emailController = TextEditingController(text: widget.teacher.email);
    _mobileNumberController =
        TextEditingController(text: widget.teacher.mobileNumber);

    _NICController = TextEditingController(text: widget.teacher.NIC);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _emailController!.dispose();
    _mobileNumberController!.dispose();

    _NICController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Teacher"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextFormField(
                controller: _firstNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "First Name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _lastNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Last Name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Email",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _mobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Mobile Number",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _NICController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "NIC",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  FirestoreHelperTeacher.updateTeacher(TeacherModel(
                    id: widget.teacher.id,
                    firstName: _firstNameController!.text,
                    lastName: _lastNameController!.text,
                    email: _emailController!.text,
                    mobileNumber: _mobileNumberController!.text,
                    NIC: _NICController!.text,
                  )).then((value) {
                    Navigator.pop(context);
                  });
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
                        "Update",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}