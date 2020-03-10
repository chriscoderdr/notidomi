class Story {
  final String id;
  final String title;
  final String subtitle;
  final String body;
  final String thumbnailUrl;
  final DateTime publishedAt;

  Story(
      {this.id,
      this.title,
      this.subtitle,
      this.body,
      this.thumbnailUrl,
      this.publishedAt});
}
