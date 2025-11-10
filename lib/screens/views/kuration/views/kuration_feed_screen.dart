import 'package:flutter/material.dart';
import 'package:koin/common/widgets/custom_bottom_navigation_bar.dart';

class KurationFeedScreen extends StatefulWidget {
  final String title;

  const KurationFeedScreen({super.key, required this.title});

  @override
  State<KurationFeedScreen> createState() => _KurationFeedScreenState();
}

class _KurationFeedScreenState extends State<KurationFeedScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  final List<String> categories = [
    'Latest',
    'All',
    'Food',
    'Tips',
    'Life',
    'Place',
    'Travel',
  ];
  int _selectedIndex = 1;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.search, color: Colors.grey, size: 20),
                        SizedBox(width: 8),
                        Text(
                          'Yeonnam-dong',
                          style: TextStyle(color: Colors.grey, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.notifications_none),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.white,
            padding: const EdgeInsets.only(left: 0.0),
            child: TabBar(
              controller: _tabController,
              isScrollable: true,
              padding: EdgeInsets.zero,
              labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
              indicator: const UnderlineTabIndicator(
                borderSide: BorderSide(width: 3.0, color: Colors.blue),
                insets: EdgeInsets.symmetric(horizontal: 10.0),
              ),
              labelColor: Colors.blue,
              unselectedLabelColor: Colors.grey[600],
              labelStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
              tabs: categories.map((name) => Tab(text: name)).toList(),
            ),
          ),
          Divider(height: 1, color: Colors.grey[200]),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children:
                  categories.map((category) {
                    return PostListView(category: category);
                  }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class PostListView extends StatelessWidget {
  final String category;

  const PostListView({super.key, required this.category});

  final List<Map<String, dynamic>> _posts = const [
    {
      'profileText': 'C',
      'name': 'chanel.korean',
      'time': '1 minute ago',
      'imagePath': 'asset/img/examples/korea_palace.jpg',
      'likes': 0,
      'comments': 0,
      'scraps': 0,
    },
    {
      'profileText': 'E',
      'name': 'editor_j00',
      'time': '5 day ago',
      'imagePath': 'asset/img/examples/whisky.jpg',
      'likes': 0,
      'comments': 0,
      'scraps': 0,
    },
    {
      'profileText': 'F',
      'name': 'food_lover',
      'time': '2 hours ago',
      'imagePath': 'asset/img/examples/pasta.jpg',
      'likes': 0,
      'comments': 0,
      'scraps': 0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredPosts = category == 'Food' ? [_posts[2]] : _posts;

    return ListView.builder(
      itemCount: filteredPosts.length,
      itemBuilder: (context, index) {
        final post = filteredPosts[index];
        return _buildPostItem(context, post: post);
      },
    );
  }

  Widget _buildPostItem(
    BuildContext context, {
    required Map<String, dynamic> post,
  }) {
    Widget postImage = Container(
      height: 250,
      width: double.infinity,
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: const Text('Post Image Placeholder', textAlign: TextAlign.center),
    );

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
      elevation: 2.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(
                post['profileText']!,
                style: const TextStyle(color: Colors.white),
              ),
            ),
            title: Text(
              post['name']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              post['time']!,
              style: const TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.more_horiz),
              onPressed: () {},
            ),
          ),
          postImage,

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIconText(Icons.favorite, Colors.red, '${post['likes']}'),
                _buildIconText(
                  Icons.chat_bubble_outline,
                  Colors.grey[700]!,
                  '${post['comments']}',
                ),
                _buildIconText(
                  Icons.bookmark_border,
                  Colors.grey[700]!,
                  '${post['scraps']}',
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
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.black,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
