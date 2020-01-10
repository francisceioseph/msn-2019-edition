import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/conversation_data_model.dart';
import 'package:messanger/src/models/message_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' show Client;

class ChatRepository {
  final Observable<FirebaseUser> currentUser;
  final Client _client = Client();

  ChatRepository({this.currentUser});

  fetchChats() {
    return currentUser.switchMap(
      (user) {
        final conversations$ = new BehaviorSubject();

        _client.get(_chatUrl(user.uid)).then(
          (response) {
            final data = json.decode(response.body);
            final datasource = ConversationDataModel.fromJson(data);
            conversations$.add(datasource);
          },
        );

        return conversations$;
      },
    );
  }

  postMessage(MessageModel message) {
    return currentUser.switchMap((user) {
      final message$ = new BehaviorSubject();

      _client.post(_chatUrl(user.uid), body: message).then((response) {
        final data = json.decode(response.body);
        final datasource = MessageModel.fromJson(data);
        message$.add(datasource);
      });

      return message$;
    });
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

  String _chatUrl(String uid) {
    return '$kRootUrl/conversations/user/$uid';
  }
}
