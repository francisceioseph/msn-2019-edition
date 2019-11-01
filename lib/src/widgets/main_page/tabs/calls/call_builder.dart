import 'package:flutter/material.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/calls_bloc.dart';
import 'package:messanger/src/widgets/main_page/tabs/calls/call_list.dart';
import 'package:messanger/src/widgets/no_friends_yet_indicator.dart';

class CallsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CallsBloc callsBloc = AppBlocProvider.of(context).callsBloc;
    callsBloc.fetchChats();

    return StreamBuilder(
      stream: callsBloc.calls,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, Map<String, dynamic>>> callsSnapshot,
      ) {
        if (!callsSnapshot.hasData) {
          return Expanded(
            child: NoFriendsYetIndicator(),
          );
        }

        return CallList(
          calls: callsSnapshot.data.values.toList(),
        );
      },
    );
  }
}
