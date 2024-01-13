

//=================================================================

// meka nikan hadana page ekak meka ain kra kiyala aulak na 


//=====================================================================

import 'package:flutter/material.dart';
import '../../../data/models/student.dart';
import 'edit_student.dart';
import '../../../data/remort_data_source/student_firebase_helper.dart';

class StudentView extends StatelessWidget {
  final List<StudentModel> studentData;

  const StudentView({Key? key, required this.studentData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Student View"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<List<StudentModel>>(
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
                                              FirestoreHelperStudent
                                                  .deleteStudent(
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
                                  decoration: const BoxDecoration(
                                    color: Colors.lightBlue,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                title: Text(
                                    "${singleStudent.firstName} ${singleStudent.lastName}"),
                                subtitle: Text("${singleStudent.email}"),
                                trailing: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => EditStudent(
                                                    student: StudentModel(
                                                      id: singleStudent.id,
                                                      firstName: singleStudent
                                                          .firstName,
                                                      lastName: singleStudent
                                                          .lastName,
                                                      email:
                                                          singleStudent.email,
                                                      mobileNumber:
                                                          singleStudent
                                                              .mobileNumber,
                                                      parentName: singleStudent
                                                          .parentName,
                                                      parentNIC: singleStudent
                                                          .parentNIC,
                                                      parentMobileNumber:
                                                          singleStudent
                                                              .parentMobileNumber,
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
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
