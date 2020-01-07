import 'package:messanger/src/models/attendant_model.dart';
import 'package:messanger/src/models/message_model.dart';

class ConversationModel {
  final String id;
  final List<AttendantModel> attendants;
  final List<MessageModel> messages;

  ConversationModel({
    this.id,
    this.attendants,
    this.messages,
  });

  ConversationModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] ?? '',
        attendants = makeAttendantsListFromJson(json['attendants'] ?? []),
        messages = makeMessagesListFromJson(json['messages'] ?? []);

  static makeAttendantsListFromJson(List<dynamic> attendantsJson) {
    return attendantsJson.map((json) => AttendantModel.fromJson(json)).toList();
  }

  static makeMessagesListFromJson(List<dynamic> messagesJson) {
    return messagesJson.map((json) => MessageModel.fromJson(json)).toList();
  }
}
