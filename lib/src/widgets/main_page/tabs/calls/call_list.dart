import 'package:flutter/material.dart';
import 'package:messanger/src/widgets/main_page/tabs/calls/call_tile.dart';

class CallList extends StatelessWidget {
  final List<dynamic> calls;

  CallList({Key key, @required this.calls}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.separated(
        itemCount: calls.length,
        itemBuilder: (BuildContext context, int index) {
          return CallListTile();
        },
        separatorBuilder: (BuildContext context, int index) {
          return Container(
            padding: EdgeInsets.only(left: 72),
            child: Divider(
              color: Colors.grey[300],
              height: 1,
            ),
          );
        },
      ),
    );
  }
}
