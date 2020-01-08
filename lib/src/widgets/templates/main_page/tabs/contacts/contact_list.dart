import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/models/user_model.dart';
import 'package:messanger/src/widgets/templates/main_page/tabs/contacts/contact_tile.dart';

class ContactList extends StatelessWidget {
  final List<UserModel> contacts;

  ContactList({Key key, @required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FriendsBloc fb = AppBlocProvider.of(context).friendsBloc;
    fb.fetchFriends();

    return Container(
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ContactListTile(
            user: contacts[index],
          );
        },
      ),
    );
  }
}
