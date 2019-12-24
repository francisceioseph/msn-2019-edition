import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  Stream<DocumentSnapshot> fetchUser(String userId) {
    return Firestore.instance.collection('users').document(userId).snapshots();
  }

  Future<void> updateUserInfo(FirebaseUser user, Map<String, dynamic> data) {
    return Firestore.instance
        .collection('users')
        .document(user.uid)
        .updateData(data);
  }
}
