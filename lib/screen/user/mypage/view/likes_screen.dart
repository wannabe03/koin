import 'package:flutter/material.dart';

class LikedKuration {
  final String imageUrl;
  final String title;
  LikedKuration({required this.imageUrl, required this.title});
}

class LikedCommunityPost {
  final String title;
  final String contentPreview;
  final String timeAgo;
  final String countryFlag;
  LikedCommunityPost({
    required this.title,
    required this.contentPreview,
    required this.timeAgo,
    required this.countryFlag,
  });
}

class LikesScreen extends StatefulWidget {
  const LikesScreen({super.key});

  @override
  State<LikesScreen> createState() => _LikesScreenState();
}

class _LikesScreenState extends State<LikesScreen> {
  bool _isLoading = true;
  List<LikedKuration> _likedKurations = [];
  List<LikedCommunityPost> _likedCommunityPosts = [];

  @override
  void initState() {
    super.initState();
    _loadLikedData();
  }

  Future<void> _loadLikedData() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _likedKurations = [
        LikedKuration(
          imageUrl:
              'https://images.unsplash.com/photo-1571008782635-f86a14c3d0f1?fit=crop&w=300&q=80',
          title: 'Fall, Farms',
        ),
        LikedKuration(
          imageUrl:
              'https://images.unsplash.com/photo-1521320226578-1f165a2cee83?fit=crop&w=300&q=80',
          title: 'Tips for...',
        ),
      ];

      _likedCommunityPosts = [
        LikedCommunityPost(
          title: 'Best restaurants in Gangneung',
          contentPreview:
              'Im a dutch who have lived in gangneung for 5 years...',
          timeAgo: '1 minute ago',
          countryFlag: '🇳🇱',
        ),
        LikedCommunityPost(
          title: 'My Bucketlist for summer',
          contentPreview: 'Going Gangneung',
          timeAgo: '1 minute ago',
          countryFlag: '🇳🇱',
        ),
      ];

      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: const Text(
            'Likes',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body:
          _isLoading
              ? const Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xFF408AFA), Color(0xFFECF5C0)],
                        stops: [0.0, 1.0],
                      ),
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 24),
                          _buildSectionHeader(
                            title: '큐레이션',
                            subtitle: 'K-uration',
                          ),
                          _buildKurationList(),
                          const SizedBox(height: 32),
                          _buildSectionHeader(
                            title: '커뮤니티',
                            subtitle: 'K-ommunity',
                          ),
                          _buildCommunityList(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required String subtitle,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        children: [
          Text(title, style: textTheme.headlineMedium),
          const SizedBox(width: 8),
          Text(
            subtitle,
            style: textTheme.headlineMedium?.copyWith(
              color: const Color(0xFFC0C0C0),
            ),
          ),
          const Spacer(),
          Text(
            'All',
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
          Icon(Icons.arrow_forward, color: Colors.blue.shade700, size: 16),
        ],
      ),
    );
  }

  Widget _buildKurationList() {
    return Container(
      height: 200,
      margin: const EdgeInsets.only(top: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _likedKurations.length,
        itemBuilder: (context, index) {
          final kuration = _likedKurations[index];
          return _LikedKurationCard(
            imageUrl: kuration.imageUrl,
            title: kuration.title,
          );
        },
      ),
    );
  }

  Widget _buildCommunityList() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      itemCount: _likedCommunityPosts.length,
      itemBuilder: (context, index) {
        final post = _likedCommunityPosts[index];
        return _LikedCommunityPostItem(
          title: post.title,
          contentPreview: post.contentPreview,
          timeAgo: post.timeAgo,
          countryFlag: post.countryFlag,
        );
      },
    );
  }
}

class _LikedKurationCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const _LikedKurationCard({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            debugPrint('Image failed to load: $exception');
          },
        ),
        color: Colors.grey.shade300,
      ),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.center,
            colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}

class _LikedCommunityPostItem extends StatelessWidget {
  final String title;
  final String contentPreview;
  final String timeAgo;
  final String countryFlag;

  const _LikedCommunityPostItem({
    required this.title,
    required this.contentPreview,
    required this.timeAgo,
    required this.countryFlag,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            contentPreview,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              letterSpacing: -0.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                timeAgo,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(width: 8),
              Text(countryFlag, style: const TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
