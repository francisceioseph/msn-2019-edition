import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/chat_bloc.dart';
import 'package:messanger/src/widgets/loader.dart';
import 'package:messanger/src/widgets/main_page/conversations.dart';

class ConversationsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ChatBloc chatBloc = AppBlocProvider.of(context).chatBloc;

    return StreamBuilder(
      stream: chatBloc.chats,
      builder: (
        BuildContext context,
        AsyncSnapshot<List<DocumentSnapshot>> chatsSnapshot,
      ) {
        if (!chatsSnapshot.hasData) {
          return LoadingIndicator();
        }

        final chats =
            chatsSnapshot.data.map((document) => document.data).toList();

        return Conversations(
          conversations: chats,
        );
      },
    );
  }
}
