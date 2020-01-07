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
