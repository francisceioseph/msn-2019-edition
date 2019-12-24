import 'package:flutter/material.dart';

class HeaderSwitch extends StatelessWidget {
  final String text;

  HeaderSwitch({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        trailing: Switch.adaptive(
          value: true,
          onChanged: (value) {},
        ),
      ),
    );
  }
}
