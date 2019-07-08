import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class ChatRepository {
  final Observable<FirebaseUser> currentUser;

  ChatRepository({this.currentUser});

  Stream<QuerySnapshot> chats() {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('users')
            .document(user.uid)
            .collection('chats')
            .snapshots();
      },
    );
  }

  Stream<DocumentSnapshot> fetchChat(String chatId) {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('users')
            .document(user.uid)
            .collection('chats')
            .document(chatId)
            .snapshots();
      },
    );
  }

  Stream<DocumentSnapshot> attendants(String chatId) {
    return currentUser.switchMap(
      (user) {
        return Firestore.instance
            .collection('users')
            .document(user.uid)
            .collection('chats')
            .document(chatId)
            .collection('attendants')
            .document('users')
            .snapshots();
      },
    );
  }
}
