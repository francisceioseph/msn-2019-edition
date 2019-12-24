import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:messanger/src/widgets/molecules/header_switch.dart';
import 'package:messanger/src/widgets/molecules/user/user_music_tile.dart';

class UserMusic extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          HeaderSwitch(
            text: "Show what I'm listening to",
          ),
          UserMusicTile(
            leadingIcon: Icon(FontAwesomeIcons.spotify),
            text: 'Spotify',
            trailingButtonText: 'Connected',
          ),
          UserMusicTile(
            leadingIcon: Icon(FontAwesomeIcons.apple),
            text: 'Apple Music',
            trailingButtonText: 'Connected',
          ),
        ],
      ),
    );
  }
}
