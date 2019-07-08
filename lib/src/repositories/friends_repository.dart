import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FriendsRepository {
  final Observable<FirebaseUser> currentUser;

  FriendsRepository({this.currentUser});

  Stream<QuerySnapshot> friendsOnline() {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('users')
            .document(user.uid)
            .collection('friends')
            .where('status', isEqualTo: 'online')
            .snapshots();
      },
    );
  }
}
