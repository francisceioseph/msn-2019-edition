import 'package:messanger/src/constants.dart';
import 'package:messanger/src/models/status.dart';

final statusMocks = [
  Status(
    id: kOnlineStatus,
    name: 'Available',
  ),
  Status(
    id: kOfflineStatus,
    name: 'Offline',
  ),
  Status(
    id: kBusyStatus,
    name: 'Busy',
  ),
  Status(
    id: kAwayStatus,
    name: 'Away',
  ),
  Status(
    id: kInvisibleStatus,
    name: 'Appear Offline',
  ),
];
