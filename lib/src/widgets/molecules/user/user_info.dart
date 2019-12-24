import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/atoms/list_item_subtitle.dart';
import 'package:messanger/src/widgets/atoms/list_item_title.dart';

class UserInfo extends StatelessWidget {
  final Map<String, dynamic> userData;

  UserInfo({@required this.userData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: ListItemTitle(
        text: userData['name'],
      ),
      subtitle: ListItemSubtitle(
        text: userData['status'],
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
