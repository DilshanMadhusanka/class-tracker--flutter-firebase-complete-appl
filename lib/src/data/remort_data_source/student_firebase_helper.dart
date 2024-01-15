import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_tracker/src/data/models/student.dart';

class FirestoreHelperStudent {
  // Implement the read method for students
  static Stream<List<StudentModel>> readStudents() {
    final studentCollection = FirebaseFirestore.instance.collection("students");
    return studentCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => StudentModel.fromSnapshot(e)).toList());
  }

  // Implement the create method for students
  static Future createStudent(StudentModel student) async {
    final studentCollection = FirebaseFirestore.instance.collection("students");

    final studentId = studentCollection.doc().id;
    final docRef = studentCollection.doc(studentId);

    final newStudent = StudentModel(
      id: studentId,
      firstName: student.firstName,
      lastName: student.lastName,
      email: student.email,
      mobileNumber: student.mobileNumber,
      parentName: student.parentName,
      parentNIC: student.parentNIC,
      parentMobileNumber: student.parentMobileNumber,
    ).toJson();

    try {
      await docRef.set(newStudent);
    } catch (e) {
      print("Error occurred while creating student: $e");
    }
  }

  // Implement the update method for students
  static Future updateStudent(StudentModel student) async {
    final studentCollection =
        FirebaseFirestore.instance.collection("students");

    final docRef = studentCollection.doc(student.id);

    final updatedStudent = StudentModel(
      id: student.id,
      firstName: student.firstName,
      lastName: student.lastName,
      email: student.email,
      mobileNumber: student.mobileNumber,
      parentName: student.parentName,
      parentNIC: student.parentNIC,
      parentMobileNumber: student.parentMobileNumber,
    ).toJson();

    try {
      await docRef.update(updatedStudent);
    } catch (e) {
      print("Error occurred while updating student: $e");
    }
  }

  // Implement the delete method for students
  static Future deleteStudent(StudentModel student) async {
    final studentCollection =
        FirebaseFirestore.instance.collection("students");

    final docRef = studentCollection.doc(student.id).delete();

    
  }
}
