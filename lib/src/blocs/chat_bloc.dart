import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/models/conversation_model.dart';
import 'package:messanger/src/repositories/chat_repository.dart';
import 'package:rxdart/rxdart.dart';

class ChatBloc {
  final _chatFetcher = PublishSubject<ConversationModel>();
  final _chatOutput = BehaviorSubject<Map<String, ConversationModel>>();

  ChatRepository _chatRepository;
  StreamSubscription _chatsSubscription;

  ChatBloc(Observable<FirebaseUser> currentUser) {
    _chatRepository = ChatRepository(currentUser: currentUser);

    currentUser.listen((user) {
      _chatFetcher.transform(_chatTransformer(user.uid)).pipe(_chatOutput);
    });
  }

  Observable<Map<String, ConversationModel>> get chats => _chatOutput.stream;

  fetchChats() {
    _chatRepository.fetchChats().listen((chats) {
      chats.conversations.forEach((chat) {
        _chatFetcher.sink.add(chat);
      });
    });
  }

  _chatTransformer(String uid) {
    return ScanStreamTransformer(
      (
        Map<String, ConversationModel> cache,
        ConversationModel conversation,
        int index,
      ) {
        final chatId = conversation.id;
        cache[chatId] = conversation;

        return cache;
      },
      <String, ConversationModel>{},
    );
  }

  dispose() {
    _chatOutput.close();
    _chatFetcher.close();
    _chatsSubscription.cancel();
  }
}
