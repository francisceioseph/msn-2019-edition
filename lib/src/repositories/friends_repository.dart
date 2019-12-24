import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FriendsRepository {
  final Observable<FirebaseUser> currentUser;

  FriendsRepository({this.currentUser});

  Observable<DocumentSnapshot> fetchFriends() {
    return currentUser.switchMap((user) {
      return Firestore.instance
          .collection('users')
          .document(user.uid)
          .snapshots();
    });
  }
}
