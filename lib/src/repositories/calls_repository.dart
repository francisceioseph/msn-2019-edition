import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class CallsRepository {
  final Observable<FirebaseUser> currentUser;

  CallsRepository({this.currentUser});

  Observable<QuerySnapshot> fetchCalls() {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('calls')
            .where(
              'attendants',
              arrayContains: user.uid,
            )
            .snapshots();
      },
    );
  }

  Observable<DocumentSnapshot> fetchCall(String chatId) {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('calls')
            .document(chatId)
            .snapshots();
      },
    );
  }
}
