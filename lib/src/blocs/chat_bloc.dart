import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/chat_repository.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChatBloc {
  final _chatFetcher = PublishSubject<DocumentSnapshot>();
  final _chatOutput = BehaviorSubject<Map<String, Map<String, dynamic>>>();

  final UserRepository _userRepository = UserRepository();
  ChatRepository _chatRepository;
  StreamSubscription _chatsSubscription;

  ChatBloc(Observable<FirebaseUser> currentUser) {
    _chatRepository = ChatRepository(currentUser: currentUser);

    currentUser.listen((user) {
      _chatFetcher.transform(_chatTransformer(user.uid)).pipe(_chatOutput);
    });
  }

  Observable<Map<String, Map<String, dynamic>>> get chats => _chatOutput.stream;

  fetchChats() {
    _chatRepository.fetchChats().listen((chats) {
      chats.documents.forEach((chat) {
        _chatFetcher.sink.add(chat);
      });
    });
  }

  _chatTransformer(String uid) {
    return ScanStreamTransformer(
      (
        Map<String, Map<String, dynamic>> cache,
        DocumentSnapshot snap,
        int index,
      ) {
        final chatId = snap.reference.documentID;
        final data = snap.data;
        final List<dynamic> attendants = data['attendants'];

        cache[chatId] = data;
        cache[chatId]['attendants'] = attendants
            .where((id) => uid != id)
            .map((userId) => _userRepository.fetchUser(userId))
            .toList();

        return cache;
      },
      <String, Map<String, dynamic>>{},
    );
  }

  dispose() {
    _chatOutput.close();
    _chatFetcher.close();
    _chatsSubscription.cancel();
  }
}
