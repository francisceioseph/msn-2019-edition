import 'package:flutter/material.dart';

class OutlineFormButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;

  OutlineFormButton({
    Key key,
    @required this.text,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: OutlineButton(
        child: Text(
          this.text,
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
