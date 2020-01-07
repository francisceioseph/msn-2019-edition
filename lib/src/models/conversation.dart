class AttendantModel {
  String id;
  String name;
  String status;
  String music;

  AttendantModel({this.id, this.name, this.status, this.music});

  AttendantModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    status = json['status'] ?? '';
    music = json['music'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['status'] = this.status;
    data['music'] = this.music;

    return data;
  }
}

class MessageModel {
  String id;
  String from;
  String to;
  String content;

  MessageModel({this.id, this.from, this.to, this.content});

  MessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    from = json['from'] ?? '';
    to = json['to'] ?? '';
    content = json['content'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['from'] = this.from;
    data['to'] = this.to;
    data['content'] = this.content;
    return data;
  }
}

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
