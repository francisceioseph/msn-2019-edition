import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/tabs/calls/call_builder.dart';

class CallsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CallsBuilder(),
      ],
    );
  }
}
