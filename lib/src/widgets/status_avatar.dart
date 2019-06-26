import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/circle_container.dart';

class StatusAvatar extends StatelessWidget {
  final String imageUrl;
  final String status;

  StatusAvatar({Key key, this.imageUrl, this.status}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleContainer(
      child: CircleAvatar(
        backgroundColor: Colors.grey[300],
        child: _imageForUrl(),
      ),
      borderColor: _borderColorForStatus(),
    );
  }

  Color _borderColorForStatus() {
    switch (this.status) {
      case kOnlineStatus:
        return kOnlineStatusColor;

      case kOfflineStatus:
        return kOfflineStatusColor;

      case kBusyStatus:
        return kBusyStatusColor;

      case kAwayStatus:
        return kAwayStatusColor;

      case kInvisibleStatus:
        return kInvisibleStatusColor;

      default:
        return Colors.transparent;
    }
  }

  Widget _imageForUrl() {
    if (this.imageUrl != null) {
      return Image.network(this.imageUrl);
    }

    return Icon(
      Icons.people,
      color: Colors.grey,
    );
  }
}
