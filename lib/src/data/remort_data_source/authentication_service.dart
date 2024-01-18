// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   Future<User?> signInWithEmailAndPassword(
//       String email, String password, String role) async {
//     try {
//       // Use Firebase Authentication to sign in
//       UserCredential authResult = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       User? user = authResult.user;

//       // Perform additional checks or actions based on the user role
//       if (user != null) {
//         // Check Firestore for additional role-specific data
//         DocumentSnapshot snapshot = await _firestore
//             .collection(role.toLowerCase() + 's')
//             .doc(user.uid)
//             .get();
//         if (snapshot.exists) {
//           // Additional role-specific data found
//           // You might want to store this data in a state management solution (e.g., Provider, Bloc)
//         } else {
//           // No additional data found, handle accordingly
//         }
//       }

//       return user;
//     } catch (e) {
//       print("Error signing in: $e");
//       return null;
//     }
//   }
// }





// // import 'package:firebase_auth/firebase_auth.dart';

// // class AuthService {
// //   final FirebaseAuth _auth = FirebaseAuth.instance;

// //   Future<User?> signInWithEmailAndPassword(String email, String password, String role) async {
// //     try {
// //       // Use Firebase Authentication to sign in
// //       UserCredential authResult = await _auth.signInWithEmailAndPassword(
// //         email: email,
// //         password: password,
// //       );
// //       User? user = authResult.user;

// //       // Perform additional checks or actions based on the user role
// //       // (e.g., check the Firestore collection for additional role-specific data)

// //       return user;
// //     } catch (e) {
// //       print("Error signing in: $e");
// //       return null;
// //     }
// //   }
// // }
