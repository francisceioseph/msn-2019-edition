import 'package:messanger/src/models/user_model.dart';

class FriendsDataModel {
  final List<UserModel> friends;

  FriendsDataModel({this.friends});

  FriendsDataModel.fromJson(Map<String, dynamic> json)
      : friends = makeFriendsListFromJson(json['friends'] ?? []);

  static makeFriendsListFromJson(List<dynamic> friends) {
    return friends.map((json) => UserModel.fromJson(json)).toList();
  }
}
