import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/organisms/contacts_builder.dart';

class ContactsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ContactsBuilder(),
    );
  }
}
