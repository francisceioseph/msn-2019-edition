class UserMusic {
  final String song;
  final String author;
  final String provider;

  UserMusic({
    this.song,
    this.author,
    this.provider,
  });

  @override
  String toString() {
    return '🎵 $song by $author on $provider';
  }
}
