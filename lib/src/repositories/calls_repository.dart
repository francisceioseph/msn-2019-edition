import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/call_data_model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:http/http.dart' show Client;

class CallsRepository {
  final Observable<FirebaseUser> currentUser;

  CallsRepository({this.currentUser});

  Observable<CallDataModel> fetchCalls() {
    return currentUser.switchMap(
      (user) {
        final calls$ = BehaviorSubject(seedValue: CallDataModel(calls: []));
        final client = Client();

        client.get('$kRootUrl/calls/user/${user.uid}').then((response) {
          final data = json.decode(response.body);
          final datasource = CallDataModel.fromJson(data);

          calls$.add(datasource);
        });

        return calls$;
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
