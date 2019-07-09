import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';

class UserRepository {
  Observable<DocumentSnapshot> fetchUser(String userId) {
    return Firestore.instance.collection('users').document(userId).snapshots();
  }
}
