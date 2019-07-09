import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/friends_repository.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class FriendsBloc {
  final _userRepository = UserRepository();
  final _onlineFriends = BehaviorSubject<List<DocumentSnapshot>>(seedValue: []);

  final _friendsFetcher = PublishSubject<String>();
  final _friendsOutput =
      BehaviorSubject<Map<String, Stream<DocumentSnapshot>>>();

  FriendsRepository _friendsRepository;
  StreamSubscription<QuerySnapshot> _onlineFriendsSubscription;

  FriendsBloc(Observable<FirebaseUser> currentUser) {
    _friendsRepository = FriendsRepository(currentUser: currentUser);

    _friendsFetcher.transform(_transformer()).pipe(_friendsOutput);

    _onlineFriendsSubscription = _friendsRepository.friendsOnline().listen(
      (snapshot) {
        _onlineFriends.sink.add(snapshot.documents);
      },
    );
  }

  Observable<List<DocumentSnapshot>> get onlineFriends => _onlineFriends.stream;

  Observable<Map<String, Stream<DocumentSnapshot>>> get friends =>
      _friendsOutput.stream;

  fetchFriends() {
    _friendsRepository.fetchFriends().listen((snap) {
      final friends = snap.data['friends'] as List<dynamic>;
      friends.forEach(_friendsFetcher.sink.add);
    });
  }

  _transformer() {
    return ScanStreamTransformer(
      (
        Map<String, Stream<DocumentSnapshot>> cache,
        String friendId,
        int index,
      ) {
        cache[friendId] = _userRepository.fetchUser(friendId);
        return cache;
      },
      <String, Stream<DocumentSnapshot>>{},
    );
  }

  dispose() {
    _friendsOutput.close();
    _friendsFetcher.close();

    _onlineFriends.close();
    _onlineFriendsSubscription.cancel();
  }
}
