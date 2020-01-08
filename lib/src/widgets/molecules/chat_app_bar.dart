import 'package:flutter/material.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/widgets/molecules/status_avatar.dart';

class ChatAppBar extends StatelessWidget {
  final UserModel user;

  ChatAppBar({@required this.user});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(
            right: 8,
          ),
          child: StatusAvatar(
            height: 40,
            width: 40,
            status: user.status,
            imageUrl: user.imageUrl,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                user.name,
                style: Theme.of(context).primaryTextTheme.title,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                user.music,
                style: Theme.of(context).primaryTextTheme.subtitle,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
      ],
    );
  }
}
