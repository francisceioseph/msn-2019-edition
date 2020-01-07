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
