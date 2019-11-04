import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/list_item_subtitle.dart';
import 'package:messanger/src/widgets/list_item_title.dart';

class UserInfo extends StatelessWidget {
  final FirebaseUser user;

  UserInfo({@required this.user});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ListItemTitle(
        text: 'Some user name',
      ),
      subtitle: ListItemSubtitle(
        text: 'some cool status here',
      ),
      trailing: RaisedButton(
        child: Text(
          'Following',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        color: kFollowingButtonColor,
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
