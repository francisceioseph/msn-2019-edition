import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/tabs/contacts/contact_tile.dart';

class ContactList extends StatelessWidget {
  final List<dynamic> contacts;

  ContactList({Key key, @required this.contacts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (BuildContext context, int index) {
          return ContactListTile();
        },
      ),
    );
  }
}
