import 'package:messanger/src/models/conversation_model.dart';

class ConversationDataModel {
  final List<ConversationModel> conversations;

  ConversationDataModel({this.conversations});

  ConversationDataModel.fromJson(Map<String, dynamic> json)
      : conversations =
            makeConversationsListFromJson(json['conversations'] ?? []);

  static makeConversationsListFromJson(List<dynamic> conversationsJson) {
    return conversationsJson
        .map((json) => ConversationModel.fromJson(json))
        .toList();
  }
}
