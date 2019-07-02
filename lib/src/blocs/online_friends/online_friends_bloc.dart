import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class OnlineFriendsBloc {
  final Observable<FirebaseUser> currentUser;

  OnlineFriendsBloc({this.currentUser});

  Observable<dynamic> get friends => currentUser.switchMap((user) {
        return Firestore.instance
            .collection('friends')
            .document(user.uid)
            .snapshots();
      });

  dispose() {}
}
