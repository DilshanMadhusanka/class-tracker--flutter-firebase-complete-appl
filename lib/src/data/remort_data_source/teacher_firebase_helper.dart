import 'package:class_tracker/src/data/models/teacher.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_tracker/src/data/models/student.dart';

class FirestoreHelperTeacher {
  // Implement the read method for teachers
  static Stream<List<TeacherModel>> readTeachers() {
    final teacherCollection = FirebaseFirestore.instance.collection("teacher");
    return teacherCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => TeacherModel.fromSnapshot(e)).toList());
  }

  // Implement the create method for teachers
  static Future createTeacher(TeacherModel teacher) async {
    final teacherCollection = FirebaseFirestore.instance.collection("teacher");

    final teacherId = teacherCollection.doc().id;
    final docRef = teacherCollection.doc(teacherId);

    final newTeacher = TeacherModel(
      id: teacherId,
      firstName: teacher.firstName,
      lastName: teacher.lastName,
      email: teacher.email,
      mobileNumber: teacher.mobileNumber,
      NIC: teacher.NIC,
    ).toJson();

    try {
      await docRef.set(newTeacher);
    } catch (e) {
      print("Error occurred while creating teacher: $e");
    }
  }

  // Implement the update method for students
  static Future updateTeacher(TeacherModel teacher) async {
    final teacherCollection = FirebaseFirestore.instance.collection("teacher");

    final docRef = teacherCollection.doc(teacher.id);

    final updatedTeacher = TeacherModel(
      id: teacher.id,
      firstName: teacher.firstName,
      lastName: teacher.lastName,
      email: teacher.email,
      mobileNumber: teacher.mobileNumber,
      NIC: teacher.NIC,
    ).toJson();

    try {
      await docRef.update(updatedTeacher);
    } catch (e) {
      print("Error occurred while updating teacher: $e");
    }
  }

  // Implement the delete method for students
  static Future deleteTeacher(TeacherModel teacher) async {
    final teacherCollection = FirebaseFirestore.instance.collection("teacher");

    final docRef = teacherCollection.doc(teacher.id).delete();
  }
}
