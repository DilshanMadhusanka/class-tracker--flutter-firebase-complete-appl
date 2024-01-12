// to implement the CRUD operations for the class model



import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:class_tracker/src/data/models/class_model.dart';

class FirestoreHelper{

  // create the firebase instance

  static Future create(ClassModel class1) async {
    final classCollection = FirebaseFirestore.instance.collection("classes");

    // variable ekak haadanawa class collection eken 
    final docRef = classCollection.doc();



    final newclass = ClassModel(
      subject: class1.subject,
      teachername: class1.teachername,
      location: class1.location  
    ).toJson();


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
}