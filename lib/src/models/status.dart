import 'package:messanger/src/constants.dart';

class Status {
  final String id;
  final String name;

  Status({this.id, this.name});

  get color => kStatusColorMap[id] ?? kStatusColorMap['default'];
}
