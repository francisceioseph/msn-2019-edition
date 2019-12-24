import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/repositories/friends_repository.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:rxdart/rxdart.dart';

class FriendsBloc {
  final _userRepository = UserRepository();

  final _friendsFetcher = PublishSubject<String>();
  final _friendsOutput =
      BehaviorSubject<Map<String, Stream<DocumentSnapshot>>>();

  final _onlineFriendsFetcher = PublishSubject<Map<String, dynamic>>();
  final _onlineFriendsOutput =
      BehaviorSubject<Map<String, Map<String, dynamic>>>();

  FriendsRepository _friendsRepository;
  StreamSubscription<QuerySnapshot> _onlineFriendsSubscription;

  FriendsBloc(Observable<FirebaseUser> currentUser) {
    _friendsRepository = FriendsRepository(currentUser: currentUser);
    _friendsFetcher.transform(_transformer()).pipe(_friendsOutput);
    _onlineFriendsFetcher
        .transform(_onlineFriendsTransformer())
        .pipe(_onlineFriendsOutput);
  }

  Observable<Map<String, Map<String, dynamic>>> get onlineFriends =>
      _onlineFriendsOutput.stream;

  Observable<Map<String, Stream<DocumentSnapshot>>> get friends =>
      _friendsOutput.stream;

  fetchFriends() {
    _friendsRepository.fetchFriends().listen((snap) {
      final friends = snap.data['friends'] as List<dynamic>;
      friends.forEach(_friendsFetcher.sink.add);
    });
  }

  fetchOnlineFriends() {
    _friendsRepository.fetchFriends().listen((snap) {
      final friends = snap.data['friends'] as List<dynamic>;

      friends.forEach((friendId) {
        _userRepository.fetchUser(friendId).listen((userSnap) {
          final user = userSnap.data;
          if (user['status'] == 'online') {
            user['uid'] = friendId;
            _onlineFriendsFetcher.sink.add(user);
          }
        });
      });
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

  _onlineFriendsTransformer() {
    return ScanStreamTransformer(
      (
        Map<String, Map<String, dynamic>> cache,
        Map<String, dynamic> friend,
        int index,
      ) {
        cache[friend['uid']] = friend;
        return cache;
      },
      <String, Map<String, dynamic>>{},
    );
  }

  dispose() {
    _friendsOutput.close();
    _friendsFetcher.close();

    _onlineFriendsFetcher.close();
    _onlineFriendsOutput.close();
    _onlineFriendsSubscription.cancel();
  }
}
