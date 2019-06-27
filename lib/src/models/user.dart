import 'package:messanger/src/models/status.dart';
import 'package:messanger/src/models/user_music.dart';

class User {
  final String name;
  final String imageUrl;
  final Status status;
  final UserMusic music;

  User({
    this.name,
    this.imageUrl,
    this.status,
    this.music,
  });
}
