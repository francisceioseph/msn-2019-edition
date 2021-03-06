import 'package:flutter/material.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/calls_bloc.dart';
import 'package:messanger/src/models/call_model.dart';
import 'package:messanger/src/widgets/templates/main_page/tabs/calls/call_list.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class CallsBuilder extends StatelessWidget {
  _fetchData(CallsBloc callsBloc) {
    callsBloc.calls.listen((Map<String, CallModel> data) {
      print(data.length);

      if (data.length == 0) {
        callsBloc.fetchChats();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    CallsBloc callsBloc = AppBlocProvider.of(context).callsBloc;

    _fetchData(callsBloc);

    return StreamBuilder(
      stream: callsBloc.calls,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, CallModel>> callsSnapshot,
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
