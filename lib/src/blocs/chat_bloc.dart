import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/chat_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChatBloc {
  final _chats = BehaviorSubject<List<DocumentSnapshot>>(seedValue: []);
  final _chat = BehaviorSubject<DocumentSnapshot>(seedValue: null);

  ChatRepository _repository;
  StreamSubscription _chatsSubscription;

  ChatBloc(Observable<FirebaseUser> currentUser) {
    _repository = ChatRepository(currentUser: currentUser);
    _chatsSubscription = _repository.chats().listen((chats) {
      _chats.sink.add(chats.documents);
    });
  }

  Observable<List<DocumentSnapshot>> get chats => _chats.stream;
  Observable<DocumentSnapshot> get chat => _chat.stream;

  fetchChat(String chatId) {
    StreamSubscription subscription;

    subscription = _repository.fetchChat(chatId).listen(
      (chat) {
        _chat.sink.add(chat);
        subscription.cancel();
      },
    );
  }

  dispose() {
    _chats.close();
    _chat.close();
    _chatsSubscription.cancel();
  }
}
