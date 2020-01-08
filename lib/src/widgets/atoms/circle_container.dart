import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  final Widget child;
  final Color borderColor;
  final double height;
  final double width;

  CircleContainer(
      {Key key,
      @required this.child,
      this.borderColor = Colors.blue,
      this.height = 60,
      this.width = 60})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      height: this.height,
      width: this.width,
      padding: const EdgeInsets.all(2.0), // borde width
      decoration: new BoxDecoration(
        color: this.borderColor, // border color
        shape: BoxShape.circle,
      ),
    );
  }
}
