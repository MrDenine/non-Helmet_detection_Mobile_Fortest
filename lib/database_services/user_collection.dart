import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> userSetup(String email, String fname, String lname) async {
  FirebaseAuth auth = FirebaseAuth.instance;
  String uid = auth.currentUser.uid.toString();
  final CollectionReference _users =
      FirebaseFirestore.instance.collection('users');
  await _users
      .doc(uid)
      .set({'Email': email, 'FirstName': fname, 'LastName': lname, 'uid': uid});
  return;
}
