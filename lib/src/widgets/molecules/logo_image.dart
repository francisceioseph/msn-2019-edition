import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/atoms/circle_container.dart';

class LogoImage extends StatelessWidget {
  const LogoImage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleContainer(
        height: 120,
        width: 120,
        child: CircleAvatar(
          radius: 60,
          backgroundColor: Colors.grey[300],
          child: Container(
            padding: EdgeInsets.all(10),
            child: Image.asset('assets/images/msn_logo.png'),
          ),
        ),
      ),
    );
  }
}
