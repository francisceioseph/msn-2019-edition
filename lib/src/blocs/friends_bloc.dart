import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/models/friends_data_model.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/repositories/friends_repository.dart';
import 'package:rxdart/rxdart.dart';

class FriendsBloc {
  final _friendsFetcher = PublishSubject<UserModel>();
  final _friendsOutput = BehaviorSubject<Map<String, UserModel>>(seedValue: {});

  final _onlineFriendsFetcher = PublishSubject<UserModel>();
  final _onlineFriendsOutput =
      BehaviorSubject<Map<String, UserModel>>(seedValue: {});

  FriendsRepository _friendsRepository;
  StreamSubscription<QuerySnapshot> _onlineFriendsSubscription;

  FriendsBloc(Observable<FirebaseUser> currentUser) {
    _friendsRepository = FriendsRepository(currentUser: currentUser);
    _friendsFetcher.transform(_transformer()).pipe(_friendsOutput);
    _onlineFriendsFetcher.transform(_transformer()).pipe(_onlineFriendsOutput);
  }

  Observable<Map<String, UserModel>> get onlineFriends =>
      _onlineFriendsOutput.stream;

  Observable<Map<String, UserModel>> get friends => _friendsOutput.stream;

  fetchFriends() {
    _friendsRepository.fetchFriends().listen((FriendsDataModel data) {
      final friends = data.friends;
      friends.forEach(_friendsFetcher.sink.add);
    });
  }

  fetchOnlineFriends() {
    _friendsRepository.fetchFriendsOnline().listen((FriendsDataModel data) {
      final friends = data.friends;
      friends.forEach(_onlineFriendsFetcher.sink.add);
    });
  }

  _transformer() {
    return ScanStreamTransformer(
      (
        Map<String, UserModel> cache,
        UserModel friend,
        int index,
      ) {
        cache[friend.id] = friend;
        return cache;
      },
      <String, UserModel>{},
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
