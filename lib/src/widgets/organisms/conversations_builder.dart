import 'package:flutter/material.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/chat_bloc.dart';
import 'package:messanger/src/models/conversation_model.dart';
import 'package:messanger/src/widgets/molecules/conversations.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class ConversationsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatBloc chatBloc = AppBlocProvider.of(context).chatBloc;
    _fetchCachedData(chatBloc);

    return StreamBuilder(
      stream: chatBloc.chats,
      builder: (
        BuildContext context,
        AsyncSnapshot<Map<String, ConversationModel>> chatsSnapshot,
      ) {
        if (!chatsSnapshot.hasData) {
          return Expanded(
            child: NoFriendsYetIndicator(),
          );
        }

        return Conversations(
          conversations: chatsSnapshot.data,
        );
      },
    );
  }

  _fetchCachedData(ChatBloc bloc) {
    bloc.chats.take(1).listen((data) {
      if (data.length == 0) {
        bloc.fetchChats();
      }
    });
  }
}
