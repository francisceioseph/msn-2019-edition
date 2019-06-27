import 'package:flutter/material.dart';

class UserMusicTile extends StatelessWidget {
  final Icon leadingIcon;
  final String text;
  final String trailingButtonText;

  UserMusicTile({
    Key key,
    this.leadingIcon,
    this.text,
    this.trailingButtonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: leadingIcon,
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        trailing: RaisedButton(
          child: Text(
            trailingButtonText,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          color: Colors.green,
          onPressed: () {},
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
