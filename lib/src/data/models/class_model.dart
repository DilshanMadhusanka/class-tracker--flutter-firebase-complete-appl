import 'package:cloud_firestore/cloud_firestore.dart';

class ClassModel {
  final String? id;
  final String? subject;
  final String? teachername;
  final String? location;
  final String? date;
  final String? time;

  ClassModel(
      {this.id,this.subject, this.teachername, this.location, this.date, this.time});

  factory ClassModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return ClassModel(
      subject: snapshot['subject'],
      teachername: snapshot['teachername'],
      location: snapshot['location'],
      id:snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        "subject": subject,
        "teachername": teachername,
        "location": location,
        "id":id,
      };
}
