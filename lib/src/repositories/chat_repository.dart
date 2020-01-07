import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/models/conversation.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' show Client;

class ChatRepository {
  final Observable<FirebaseUser> currentUser;

  final Client _client = Client();
  final _kRootUrl = 'http://10.0.2.2:3000';

  ChatRepository({this.currentUser});

  fetchChats() {
    return currentUser.switchMap(
      (user) {
        final conversations = new BehaviorSubject(
          seedValue: ConversationDataModel(conversations: []),
        );

        _client.get('$_kRootUrl/conversations/user/${user.uid}').then(
          (response) {
            final data = json.decode(response.body);
            final datasource = ConversationDataModel.fromJson(data);
            conversations.sink.add(datasource);
          },
        );

        return conversations;
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
