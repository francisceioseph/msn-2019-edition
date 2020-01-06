import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/mocks/status.dart';
import 'package:messanger/src/repositories/user_repository.dart';
import 'package:messanger/src/widgets/molecules/header_switch.dart';
import 'package:messanger/src/widgets/templates/loading_dialog.dart';

class UserStatus extends StatelessWidget {
  final FirebaseUser user;
  final Map<String, dynamic> userData;

  UserStatus({
    Key key,
    @required this.user,
    @required this.userData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final statuses = statusMocks;

    return Container(
      padding: EdgeInsets.only(
        top: 16,
        bottom: 16,
      ),
      child: Container(
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
                final statusName = statusMocks[index].name;
                final statusId = statusMocks[index].id;

                return ListTile(
                  title: Text(
                    statusName,
                    style: Theme.of(context)
                        .primaryTextTheme
                        .merge(
                          TextTheme(
                            body1: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                        .body1,
                  ),
                  trailing: _renderTrailing(statusId),
                  onTap: () {
                    _changeUserStatus(context, statusId);
                  },
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

  Widget _renderTrailing(String itemStatus) {
    final status = userData['status'].toString().toLowerCase();
    final iStatus = itemStatus.toLowerCase();

    if (status.contains(iStatus)) {
      return Icon(
        Icons.check,
        color: Colors.green,
      );
    }

    return null;
  }

  void _changeUserStatus(
    BuildContext context,
    String statusId,
  ) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return LoadingDialog();
      },
    );

    UserRepository().updateUserInfo(
      this.user,
      {'status': statusId},
    ).then((value) {
      Navigator.of(context).pop();
    });
  }
}
