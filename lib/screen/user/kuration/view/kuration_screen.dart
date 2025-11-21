import 'package:flutter/material.dart';
import 'package:koin/screen/user/kuration/widget/kuration_search_field.dart';
import 'package:koin/screen/user/kuration/widget/kuration_tabs.dart';
import 'package:koin/screen/user/kuration/widget/kuration_featured.dart';
import 'package:koin/screen/user/kuration/widget/kuration_grid.dart';
import 'package:koin/common/const/colors.dart';

class KurationScreen extends StatefulWidget {
  const KurationScreen({super.key});

  @override
  State<KurationScreen> createState() => _KurationScreenState();
}

class _KurationScreenState extends State<KurationScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<String> _tabs = [
    'All',
    'Food',
    'Tips',
    'Life',
    'Place',
    'Fest',
    'Laws',
  ];
  final PageController _pageController = PageController();

  final Map<String, String> gridItems = const {
    'Beer Spot 6': 'asset/img/examples/beer.jpg',
    'Busan Cafes': 'asset/img/examples/coffee.jpg',
    'Europe in Seoul': 'asset/img/examples/europe.jpg',
    'Jeonju Course': 'asset/img/examples/jeonju.jpg',
  };

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

  void _fetchAllNotifs() {
    // TODO: add fetching logic
    // TODO: navigate to noti page
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: SafeArea(
        child: Column(
          children: [
            KurationSearchField(onAlarmTap: () => {}),
            KurationFeatured(controller: _pageController),
            Container(
              height: 12,
              color: SUB_PRIMARY_COLOR.withValues(alpha: 0.5),
            ),
            KurationTabs(
              controller: _tabController,
              tabs: _tabs,
              hasSortButton: false,
              showShadow: true,
              showShadowBottomOnly: false,
            ),
            // const Divider(thickness: 1, height: 1, color: Color(0xFFF0F0F0)),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children:
                    _tabs.map((tabName) {
                      return KurationGrid(items: gridItems);
                    }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
