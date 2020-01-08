class UserModel {
  String id;
  String name;
  String email;
  String status;
  String music;
  String imageUrl;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.status,
    this.music,
    this.imageUrl,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    email = json['email'] ?? '';
    status = json['status'] ?? '';
    music = json['music'] ?? '';
    imageUrl = json['imageUrl'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['status'] = this.status;
    data['music'] = this.music;
    data['imageUrl'] = this.imageUrl;

    return data;
  }
}
