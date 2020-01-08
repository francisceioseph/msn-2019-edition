import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;

  CircleContainer({
    Key key,
    @required this.child,
    this.borderColor = Colors.blue,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: 60,
      width: 60,
      padding: const EdgeInsets.all(2.0), // borde width
      decoration: new BoxDecoration(
        color: this.borderColor, // border color
        shape: BoxShape.circle,
      ),
    );
  }
}
