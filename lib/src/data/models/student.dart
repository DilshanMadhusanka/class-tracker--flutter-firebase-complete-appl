import 'package:cloud_firestore/cloud_firestore.dart';

class StudentModel {
  final String? id;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? mobileNumber;
  final String? parentName;
  final String? parentNIC;
  final String? parentMobileNumber;

  StudentModel({
    this.id,
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.parentName,
    this.parentNIC,
    this.parentMobileNumber,
  });

  factory StudentModel.fromSnapshot(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return StudentModel(
      firstName: snapshot['firstName'],
      lastName: snapshot['lastName'],
      email: snapshot['email'],
      mobileNumber: snapshot['mobileNumber'],
      parentName: snapshot['parentName'],
      parentNIC: snapshot['parentNIC'],
      parentMobileNumber: snapshot['parentMobileNumber'],
      id: snapshot['id'],
    );
  }

  Map<String, dynamic> toJson() => {
        'firstName': firstName,
        'lastName': lastName,
        'email': email,
        'mobileNumber': mobileNumber,
        'parentName': parentName,
        'parentNIC': parentNIC,
        'parentMobileNumber': parentMobileNumber,
        'id': id,
      };
}
