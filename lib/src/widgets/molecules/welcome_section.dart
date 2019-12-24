import 'package:flutter/material.dart';

class WelcomeSection extends StatelessWidget {
  final String welcomeText;
  final String sideButtonText;
  final void Function() onSideButtonPressed;

  const WelcomeSection({
    Key key,
    @required this.welcomeText,
    this.sideButtonText,
    this.onSideButtonPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 16,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          Text(
            this.welcomeText,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
          if (this.sideButtonText != null)
            FlatButton(
              child: Text(
                this.sideButtonText,
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: this.onSideButtonPressed,
            )
        ],
      ),
    );
  }
}
