class User {
  final String name;
  final String imageUrl;
  final String status;
  final String music;

  User({
    this.name,
    this.imageUrl,
    this.status,
    this.music,
  });

  User.fromMap(Map<String, dynamic> userMap)
      : name = userMap['name'] ?? '',
        imageUrl = userMap['imageUrl'] ?? '',
        status = userMap['status'] ?? '',
        music = userMap['music'] ?? '';
}
