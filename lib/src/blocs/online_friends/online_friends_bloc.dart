import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/friends_repository.dart';
import 'package:rxdart/rxdart.dart';

class OnlineFriendsBloc {
  final _friends = BehaviorSubject<List<DocumentSnapshot>>(seedValue: []);

  FriendsRepository _repository;
  StreamSubscription<QuerySnapshot> _onlineFriendsSubscription;

  OnlineFriendsBloc(Observable<FirebaseUser> currentUser) {
    _repository = FriendsRepository(currentUser: currentUser);

    _onlineFriendsSubscription = _repository.friendsOnline().listen(
      (snapshot) {
        _friends.sink.add(snapshot.documents);
      },
    );
  }

  Observable<List<DocumentSnapshot>> get friends => _friends.stream;

  dispose() {
    _friends.close();
    _onlineFriendsSubscription.cancel();
  }
}
