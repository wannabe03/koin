import 'package:flutter/material.dart';

class KurationFeedScreen extends StatelessWidget {
  final String title;

  const KurationFeedScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPostItem(
              context,
              profileText: 'C',
              name: 'chanel.korean',
              time: '1 minute ago',
              postTitle: 'Daily Korean 5',
              imagePath: 'asset/img/examples/korea_palace.jpg',
              likes: 68,
              comments: 28,
              scraps: 53,
            ),
            _buildPostItem(
              context,
              profileText: 'E',
              name: 'editor_j00',
              time: '5 day ago',
              postTitle: 'Whiskey Selection',
              imagePath: 'asset/img/examples/whisky.jpg',
              likes: 102,
              comments: 40,
              scraps: 80,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(
    BuildContext context, {
    required String profileText,
    required String name,
    required String time,
    required String postTitle,
    required String imagePath,
    required int likes,
    required int comments,
    required int scraps,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(child: Text(profileText)),
            title: Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(time, style: const TextStyle(color: Colors.grey)),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.asset(imagePath, fit: BoxFit.cover, cacheWidth: 500),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              postTitle,
              style: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconText(Icons.favorite, Colors.red, 'Like $likes'),
                _buildIconText(
                  Icons.chat_bubble_outline,
                  Colors.grey[700]!,
                  'Comment $comments',
                ),
                _buildIconText(
                  Icons.bookmark_border,
                  Colors.grey[700]!,
                  'Scrap $scraps',
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 20),
        const SizedBox(width: 4),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
