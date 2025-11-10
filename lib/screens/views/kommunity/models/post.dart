class Post {
  final String title;
  final String content;
  final String timeAgo;
  final String flag;
  final String? imageUrl;
  final String author;

  final String date;
  final int likes;
  final int comments;
  final int scraps;

  const Post({
    required this.title,
    required this.content,
    required this.timeAgo,
    required this.flag,
    this.imageUrl,

    this.date = '',
    this.likes = 0,
    this.comments = 0,
    this.scraps = 0,
    this.author = '',
  });
}
