import 'package:cloud_firestore/cloud_firestore.dart';

class TeacherModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;

  final String? NIC;

  TeacherModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.NIC,
  });

  factory TeacherModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return TeacherModel(
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      email: snapshot['email'],
      mobileNumber: snapshot['mobileNumber'],
      NIC: snapshot['NIC'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'mobileNumber': mobileNumber,
        'NIC': NIC,
        'id': id,
      };
}
