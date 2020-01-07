import 'package:jiffy/jiffy.dart';
import 'package:messanger/src/models/attendant_model.dart';

class CallModel {
  final String id;
  final List<AttendantModel> attendants;

  final Jiffy startedAt;
  final Jiffy endedAt;

  CallModel({
    this.id,
    this.attendants,
    this.startedAt,
    this.endedAt,
  });

  CallModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        attendants = makeAttendants(json['attendants'] ?? []),
        startedAt = Jiffy(json['startedAt'] ?? '', 'yyyy-MM-dd HH:mm'),
        endedAt = Jiffy(json['endedAt'] ?? '', 'yyyy-MM-dd HH:mm');

  Map<String, dynamic> toJson() {
    final data = Map();

    data['id'] = this.id;
    data['startedAt'] = this.startedAt.dateTime.toIso8601String();
    data['endedAt'] = this.endedAt.dateTime.toIso8601String();

    data['attendants'] =
        this.attendants.map((attendant) => attendant.toJson()).toList();

    return data;
  }

  static makeAttendants(List<dynamic> attendants) {
    return attendants
        .map((attendant) => AttendantModel.fromJson(attendant))
        .toList();
  }
}
