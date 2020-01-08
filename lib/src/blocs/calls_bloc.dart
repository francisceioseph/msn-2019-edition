import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/models/call_model.dart';
import 'package:messanger/src/repositories/calls_repository.dart';
import 'package:rxdart/rxdart.dart';

class CallsBloc {
  final _callsFetcher = PublishSubject<CallModel>();
  final _callsOutput = BehaviorSubject<Map<String, CallModel>>(seedValue: {});

  CallsRepository _callsRepository;
  StreamSubscription _callsSubscription;

  CallsBloc(Observable<FirebaseUser> currentUser) {
    _callsRepository = CallsRepository(currentUser: currentUser);

    currentUser.listen((user) {
      _callsFetcher.transform(_callTransformer(user.uid)).pipe(_callsOutput);
    });
  }

  Observable<Map<String, CallModel>> get calls => _callsOutput.stream;

  fetchChats() {
    _callsRepository.fetchCalls().listen((calls) {
      calls.calls.forEach((call) {
        _callsFetcher.sink.add(call);
      });
    });
  }

  _callTransformer(String uid) {
    return ScanStreamTransformer(
      (
        Map<String, CallModel> cache,
        CallModel call,
        int index,
      ) {
        final callId = call.id;
        cache[callId] = call;

        return cache;
      },
      <String, CallModel>{},
    );
  }

  dispose() {
    _callsOutput.close();
    _callsFetcher.close();
    _callsSubscription.cancel();
  }
}
