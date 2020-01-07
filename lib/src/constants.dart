import 'package:flutter/material.dart';

const kOnlineStatus = 'online';
const kOfflineStatus = 'offline';
const kBusyStatus = 'busy';
const kAwayStatus = 'away';
const kInvisibleStatus = 'invisible';

const kOnlineStatusColor = Colors.green;
const kOfflineStatusColor = Colors.grey;
const kBusyStatusColor = Color(0xffd32f2f);
const kAwayStatusColor = Color(0xffffa726);
const kInvisibleStatusColor = Color(0xffbdbdbd);

const kFollowingButtonColor = Colors.blue;

const kStatusColorMap = {
  "$kOnlineStatus": kOnlineStatusColor,
  "$kOfflineStatus": kOfflineStatusColor,
  "$kBusyStatus": kBusyStatusColor,
  "$kAwayStatus": kAwayStatusColor,
  "$kInvisibleStatus": kInvisibleStatusColor,
  "default": Colors.transparent,
};

const kRootUrl = 'http://10.0.2.2:3000';
