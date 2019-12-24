import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/blocs/app_bloc_provider.dart';
import 'package:messanger/src/blocs/friends_bloc.dart';
import 'package:messanger/src/models/user.dart';
import 'package:messanger/src/widgets/templates/main_page/tabs/contacts/contact_tile.dart';
import 'package:messanger/src/widgets/molecules/no_friends_yet_indicator.dart';

class ContactList extends StatelessWidget {
  final List<dynamic> contacts;

  ContactList({Key key, @required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final FriendsBloc fb = AppBlocProvider.of(context).friendsBloc;
    fb.fetchFriends();

    return StreamBuilder(
        stream: fb.friends,
        builder: (
          BuildContext context,
          AsyncSnapshot<Map<String, Stream<DocumentSnapshot>>> snap,
        ) {
          if (!snap.hasData) {
            return NoFriendsYetIndicator();
          }

          final streams = snap.data.values.toList();
          return Container(
            child: ListView.builder(
              itemCount: streams.length,
              itemBuilder: (BuildContext context, int index) {
                return StreamBuilder(
                    stream: streams[index],
                    builder: (
                      BuildContext context,
                      AsyncSnapshot<DocumentSnapshot> docSnap,
                    ) {
                      if (!docSnap.hasData) {
                        return NoFriendsYetIndicator();
                      }

                      final friend = docSnap.data.data;
                      return ContactListTile(
                        user: User.fromMap(friend),
                      );
                    });
              },
            ),
          );
        });
  }
}
