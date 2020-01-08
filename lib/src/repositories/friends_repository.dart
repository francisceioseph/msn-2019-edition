import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/friends_data_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' show Client;

class FriendsRepository {
  final Observable<FirebaseUser> currentUser;
  FriendsRepository({this.currentUser});
  final _client = Client();

  Observable<FriendsDataModel> fetchFriends() {
    return currentUser.switchMap((user) {
      final friends$ = BehaviorSubject(
        seedValue: FriendsDataModel(friends: []),
      );

      _client.get('$kRootUrl/friends/user/${user.uid}').then((response) {
        final data = json.decode(response.body);
        final datasource = FriendsDataModel.fromJson(data);

        friends$.add(datasource);
      });

      return friends$;
    });
  }

  Observable<FriendsDataModel> fetchFriendsOnline() {
    return currentUser.switchMap((user) {
      final friends$ = BehaviorSubject(
        seedValue: FriendsDataModel(friends: []),
      );

      _client
          .get('$kRootUrl/friends/user/${user.uid}/status/online')
          .then((response) {
        final data = json.decode(response.body);
        final datasource = FriendsDataModel.fromJson(data);

        friends$.add(datasource);
      });

      return friends$;
    });
  }
}
