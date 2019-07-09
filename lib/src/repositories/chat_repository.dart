import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ChatRepository {
  final Observable<FirebaseUser> currentUser;

  ChatRepository({this.currentUser});

  Observable<QuerySnapshot> fetchChats() {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('chats')
            .where(
              'attendants',
              arrayContains: user.uid,
            )
            .snapshots();
      },
    );
  }

  Observable<DocumentSnapshot> fetchChat(String chatId) {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('chats')
            .document(chatId)
            .snapshots();
      },
    );
  }
}
