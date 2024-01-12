
import 'package:cloud_firestore/cloud_firestore.dart';



class ClassModel {
  final String? subject;
  final String? teachername;
  final String? location;
  final String? date;
  final String? time;

  ClassModel(
      {this.subject, this.teachername, this.location, this.date, this.time});

  factory ClassModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ClassModel(
      subject: snapshot['subject'],
      teachername: snapshot['teachername'],
      location: snapshot['location'],
    );
  }



   Map<String, dynamic> toJson() => {
    "subject": subject,
    "teachername":teachername,
    "location": location,
  };
}
