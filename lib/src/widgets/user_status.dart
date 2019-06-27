import 'package:flutter/material.dart';
import 'package:messanger/src/mocks/status.dart';
import 'package:messanger/src/widgets/header_switch.dart';

class UserStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final statuses = statusMocks;

    return Container(
      color: Colors.blueGrey[50],
      padding: EdgeInsets.only(top: 16, bottom: 16),
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            HeaderSwitch(
              text: 'Status',
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              itemCount: statuses.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    statusMocks[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  indent: 16,
                  color: Colors.grey[300],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
