import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  Stream<DocumentSnapshot> fetchUser(String userId) {
    return Firestore.instance.collection('users').document(userId).snapshots();
  }
}
