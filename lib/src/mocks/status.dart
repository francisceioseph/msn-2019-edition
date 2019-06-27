import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/status.dart';

final statusMocks = [
  Status(
    id: kOnlineStatus,
    name: 'Available',
    color: kOnlineStatusColor,
  ),
  Status(
    id: kOfflineStatus,
    name: 'Offline',
    color: kOfflineStatusColor,
  ),
  Status(
    id: kBusyStatus,
    name: 'Busy',
    color: kBusyStatusColor,
  ),
  Status(
    id: kAwayStatus,
    name: 'Away',
    color: kAwayStatusColor,
  ),
  Status(
    id: kInvisibleStatus,
    name: 'Appear Offline',
    color: kInvisibleStatusColor,
  ),
];
