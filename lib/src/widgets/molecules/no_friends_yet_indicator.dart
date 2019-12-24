import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/molecules/missing_data_indicator.dart';

class NoFriendsYetIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MissingDataIndicator(
      icon: Icons.people,
      message:
          'You don\'nt have any friends yet! Add some contacts and start chatting!',
    );
  }
}
