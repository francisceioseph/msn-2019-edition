import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/widgets/templates/main_page/tabs/contacts/contact_list.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class ContactsBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final FriendsBloc bloc = AppBlocProvider.of(context).friendsBloc;
    _fetchCachedData(bloc);

    return StreamBuilder(
        stream: bloc.friends,
        builder: (
          BuildContext context,
          AsyncSnapshot<Map<String, UserModel>> snap,
        ) {
          if (!snap.hasData) {
            return NoFriendsYetIndicator();
          }

          final friends = snap.data.values.toList();

          return ContactList(
            contacts: friends,
          );
        });
  }

  _fetchCachedData(FriendsBloc bloc) {
    bloc.friends.take(1).listen((data) {
      if (data.length == 0) {
        bloc.fetchFriends();
      }
    });
  }
}
