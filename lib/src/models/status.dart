import 'package:flutter/material.dart';
import 'package:messanger/src/constants.dart';

class Status {
  final String id;
  final String name;

  Status({this.id, this.name});

  get color => () {
        switch (id) {
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
      };
}
