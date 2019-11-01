import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/calls_repository.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class CallsBloc {
  final _callsFetcher = PublishSubject<DocumentSnapshot>();
  final _callsOutput = BehaviorSubject<Map<String, Map<String, dynamic>>>();

  final UserRepository _userRepository = UserRepository();
  CallsRepository _callsRepository;
  StreamSubscription _callsSubscription;

  CallsBloc(Observable<FirebaseUser> currentUser) {
    _callsRepository = CallsRepository(currentUser: currentUser);

    currentUser.listen((user) {
      _callsFetcher.transform(_callTransformer(user.uid)).pipe(_callsOutput);
    });
  }

  Observable<Map<String, Map<String, dynamic>>> get calls =>
      _callsOutput.stream;

  fetchChats() {
    _callsRepository.fetchCalls().listen((calls) {
      calls.documents.forEach((call) {
        _callsFetcher.sink.add(call);
      });
    });
  }

  _callTransformer(String uid) {
    return ScanStreamTransformer(
      (
        Map<String, Map<String, dynamic>> cache,
        DocumentSnapshot snap,
        int index,
      ) {
        final callId = snap.reference.documentID;
        final data = snap.data;
        final List<dynamic> attendants = data['attendants'];

        cache[callId] = data;
        cache[callId]['attendants'] = attendants
            .where((id) => uid != id)
            .map((userId) => _userRepository.fetchUser(userId))
            .toList();

        return cache;
      },
      <String, Map<String, dynamic>>{},
    );
  }

  dispose() {
    _callsOutput.close();
    _callsFetcher.close();
    _callsSubscription.cancel();
  }
}
