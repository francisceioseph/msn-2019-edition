import 'package:flutter/material.dart';

class LoadingDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          color: Theme.of(context).dialogBackgroundColor,
        ),
        child: new Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: EdgeInsets.only(right: 24),
              child: CircularProgressIndicator(),
            ),
            new Text("Loading..."),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
    );
  }
}
