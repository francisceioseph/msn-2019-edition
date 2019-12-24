import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String buttonText;
  final void Function() onPressed;

  RoundedButton({
    Key key,
    @required this.buttonText,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: OutlineButton(
        child: Text(
          this.buttonText,
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        color: Colors.blue,
        textColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        borderSide: BorderSide(color: Colors.blue),
        onPressed: this.onPressed,
      ),
    );
  }
}
