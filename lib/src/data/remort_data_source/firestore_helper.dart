// to implement the CRUD operations for the class model

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_tracker/src/data/models/class_model.dart';

class FirestoreHelper {
  // implement the read method
  static Stream<List<ClassModel>> read() {
    final classCollection = FirebaseFirestore.instance.collection("classes");
    return classCollection.snapshots().map((querySnapshot) =>
        querySnapshot.docs.map((e) => ClassModel.fromSnapshot(e)).toList());
  }

  // implement the create methode

  static Future create(ClassModel class1) async {
    final classCollection = FirebaseFirestore.instance.collection("classes");

    // variable ekak haadanawa class collection eken

    final classid = classCollection
        .doc()
        .id; // random widihata genearate una id eka store krann variable ekak hadanwa.
    final docRef = classCollection.doc(classid);

    final newclass = ClassModel(
            id: classid,
            subject: class1.subject,
            teachername: class1.teachername,
            location: class1.location)
        .toJson();

    try {
      await docRef.set(newclass);
    } catch (e) {
      print("some error occured $e");
    }

/*
    await docRef.set({
      "subjectname": _subjectController.text,
      "teachername": _teacherNameController.text,
      "location ": _locationController.text
    });

    */
  }

// Update class methode

  static Future update(ClassModel class1) async {
    final classCollection =
        FirebaseFirestore.instance.collection("classes"); // accessing the class

    // variable ekak haadanawa class collection eken

    final docRef =
        classCollection.doc(class1.id); // uda hadpu id eken access kranwa

    final newclass = ClassModel(
            id: class1.id,
            subject: class1.subject,
            teachername: class1.teachername,
            location: class1.location)
        .toJson();

    try {
      await docRef.update(newclass);
    } catch (e) {
      print("some error occured $e");
    }
  }

// Delete Method

  static Future delete(ClassModel class1) async {
    final classCollection =
        FirebaseFirestore.instance.collection("classes"); // accessing the class  

    // variable ekak haadanawa class collection eken  

    final docRef =
        classCollection.doc(class1.id).delete(); // class id eken delete kranne
  }
}

//   static Future update(ClassModel class1) async {
//     final classCollection = FirebaseFirestore.instance.collection("classes");

//     // variable ekak haadanawa class collection eken
//     final docRef = classCollection.doc();

//     try {
//       await docRef.update(newclass);
//     } catch (e) {
//       print("some error occured $e");
//     }
//   }
// }
