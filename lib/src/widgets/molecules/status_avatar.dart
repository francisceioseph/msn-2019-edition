import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';
import 'package:messanger/src/widgets/atoms/circle_container.dart';

class StatusAvatar extends StatelessWidget {
  final String imageUrl;
  final String status;
  final double height;
  final double width;

  StatusAvatar({
    Key key,
    this.imageUrl,
    this.status,
    this.height = 60,
    this.width = 60,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CircleContainer(
        height: this.height,
        width: this.width,
        child: CircleAvatar(
          backgroundColor: Colors.grey[300],
          child: _imageForUrl(),
        ),
        borderColor: _borderColorForStatus(),
      ),
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
      return Container(
        height: 52,
        width: 52,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.none,
            image: CachedNetworkImageProvider(this.imageUrl, errorListener: () {
              return Icon(
                Icons.people,
                color: Colors.grey,
              );
            }),
          ),
        ),
      );
    }

    return Icon(
      Icons.people,
      color: Colors.grey,
    );
  }
}
