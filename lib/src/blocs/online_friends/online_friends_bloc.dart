import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OnlineFriendsBloc {
  final Observable<FirebaseUser> currentUser;

  OnlineFriendsBloc({this.currentUser});

  Observable<QuerySnapshot> get friends => currentUser.switchMap(
        (user) {
          return Firestore.instance
              .collection('users')
              .document(user.uid)
              .collection('friends')
              .where('status', isEqualTo: 'online')
              .snapshots();
        },
      );

  dispose() {}
}
