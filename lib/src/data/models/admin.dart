// // admin_model.dart
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AdminModel {
//   final String id;
//   final String email;
//   final String password; // Added password attribute

//   AdminModel({
//     required this.id,
//     required this.email,
//     required this.password,
//   });

//   factory AdminModel.fromSnapshot(DocumentSnapshot snap) {
//     var snapshot = snap.data() as Map<String, dynamic>;

//     return AdminModel(
//       id: snapshot['id'],
//       email: snapshot['email'],
//       password: snapshot['password'],
//     );
//   }

//   Map<String, dynamic> toJson() => {
//         'id': id,
//         'email': email,
//         'password': password,
//       };
// }
