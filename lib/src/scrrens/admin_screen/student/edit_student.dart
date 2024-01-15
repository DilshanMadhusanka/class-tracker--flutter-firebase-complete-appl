import 'package:class_tracker/src/data/models/student.dart'; // Import your StudentModel
import 'package:flutter/material.dart';
import '../../../data/remort_data_source/student_firebase_helper.dart';

class EditStudent extends StatefulWidget {
  final StudentModel student;
  const EditStudent({Key? key, required this.student}) : super(key: key);

  @override
  _EditStudentState createState() => _EditStudentState();
}

class _EditStudentState extends State<EditStudent> {
  TextEditingController? _firstNameController;
  TextEditingController? _lastNameController;
  TextEditingController? _emailController;
  TextEditingController? _mobileNumberController;
  TextEditingController? _parentNameController;
  TextEditingController? _parentNICController;
  TextEditingController? _parentMobileNumberController;

  @override
  void initState() {
    _firstNameController = TextEditingController(text: widget.student.firstName);
    _lastNameController = TextEditingController(text: widget.student.lastName);
    _emailController = TextEditingController(text: widget.student.email);
    _mobileNumberController = TextEditingController(text: widget.student.mobileNumber);
    _parentNameController = TextEditingController(text: widget.student.parentName);
    _parentNICController = TextEditingController(text: widget.student.parentNIC);
    _parentMobileNumberController = TextEditingController(text: widget.student.parentMobileNumber);

    super.initState();
  }

  @override
  void dispose() {
    _firstNameController!.dispose();
    _lastNameController!.dispose();
    _emailController!.dispose();
    _mobileNumberController!.dispose();
    _parentNameController!.dispose();
    _parentNICController!.dispose();
    _parentMobileNumberController!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Student"),
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
              TextFormField(
                controller: _parentNameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parent Name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _parentNICController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parent NIC",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: _parentMobileNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Parent Mobile Number",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {
                  FirestoreHelperStudent.updateStudent(StudentModel(
                    id: widget.student.id,
                    firstName: _firstNameController!.text,
                    lastName: _lastNameController!.text,
                    email: _emailController!.text,
                    mobileNumber: _mobileNumberController!.text,
                    parentName: _parentNameController!.text,
                    parentNIC: _parentNICController!.text,
                    parentMobileNumber: _parentMobileNumberController!.text,
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
