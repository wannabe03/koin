import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/common/widget/custom_app_bar.dart';
import 'package:koin/screen/user/kuration/widget/kuration_feed_card.dart';
import 'package:koin/screen/user/kuration/widget/kuration_filter_chip.dart';
import 'package:koin/screen/user/kuration/widget/kuration_search_field.dart';
import 'package:koin/screen/user/kuration/widget/kuration_tabs.dart';

class KurationFeedScreen extends StatefulWidget {
  const KurationFeedScreen({super.key, required this.title});
  final String title;

  @override
  State<StatefulWidget> createState() => _KurationFeedScreenState();
}

class _KurationFeedScreenState extends State<KurationFeedScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late final String title;
  final PageController _pageController = PageController();
  final List<String> _tabs = [
    'All',
    'Food',
    'Tips',
    'Life',
    'Place',
    'Fest',
    'Laws',
  ];

  final List<KurationFeedPost> _posts = [
    KurationFeedPost(
      username: 'channel.korean',
      uploadedDateTime: DateTime.now(),
      title: 'Daily Korean 5',
      subtitle: '이거 두 개 얼마예요?',
      imagePath: 'asset/img/examples/korea_palace.jpg',
      likeCount: 68,
      commentCount: 28,
      scrapCount: 53,
      comments: [],
    ),
    KurationFeedPost(
      username: 'editor_j00',
      uploadedDateTime: DateTime(2025, 11, 16, 0, 0, 0),
      title: 'Whiskey Selection',
      subtitle: '한국에서 만날 수 있는 위스키',
      imagePath: 'asset/img/examples/whisky.jpg',
      likeCount: 102,
      commentCount: 40,
      scrapCount: 80,
      comments: [],
    ),
    KurationFeedPost(
      username: 'foodfighter_',
      uploadedDateTime: DateTime(2025, 11, 20, 0, 0, 0),
      title: 'Seoul Tea Café 10',
      subtitle: '세계에서 인정받는 우리 차',
      imagePath: 'asset/img/examples/tea.png',
      likeCount: 68,
      commentCount: 28,
      scrapCount: 53,
      comments: [],
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              // TODO: fetch posts as list, map elements and build
              child: Container(
                color: GrayScale.gray100,
                child: Column(
                  children: [
                    KurationSearchField(),
                    KurationTabs(
                      controller: _tabController,
                      tabs: _tabs,
                      hasSortButton: true,
                      showShadow: true,
                      sortOption: SortOption.latest,
                      showShadowBottomOnly: true,
                    ),
                    Container(color: GrayScale.gray100),
                    Column(
                      spacing: 12,
                      children: [
                        SizedBox(),
                        ..._posts.map(
                          (e) => _buildPostItem(
                            uploaderUsername: e.username,
                            uploadedDateTime: e.uploadedDateTime,
                            postTitle: e.title,
                            postSubtitle: e.subtitle,
                            imagePath: e.imagePath,
                            likes: e.likeCount ?? 0,
                            comments: e.commentCount ?? 0,
                            scraps: e.scrapCount ?? 0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPostItem(
  // BuildContext context,
  {
    required String uploaderUsername,
    required DateTime uploadedDateTime,
    required String postTitle,
    required String postSubtitle,
    required String imagePath,
    required int likes,
    required int comments,
    required int scraps,
  }) {
    return KurationFeedCard(
      post: KurationFeedPost(
        imagePath: imagePath,
        subtitle: postSubtitle,
        title: postTitle,
        username: uploaderUsername,
        uploadedDateTime: uploadedDateTime,
        likeCount: likes,
        commentCount: comments,
        scrapCount: scraps,
        comments: [],
      ),
    );
  }
}
