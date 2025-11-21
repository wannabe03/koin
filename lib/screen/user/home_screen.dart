import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/common/widget/custom_app_bar.dart';
import 'package:koin/common/widget/custom_bottom_navigation_bar.dart';
import 'package:koin/screen/user/koin/view/koin_screen.dart';
import 'package:koin/screen/user/kuration/view/kuration_feed_screen.dart';
import 'package:koin/screen/user/kuration/view/kuration_screen.dart';
import 'package:koin/screen/user/kommunity/view/kommunity_screen.dart';
import 'package:koin/screen/user/kamera/view/kamera_screen.dart';
import 'package:koin/screen/user/mypage/view/my_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          (_currentIndex == 1 ||
                  _currentIndex == 2 ||
                  _currentIndex == 3 ||
                  _currentIndex == 4)
              ? null
              : customAppBar(
                context,
                onTabSelected: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                  _pageController.jumpToPage(index);
                },
              ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          KoinScreen(),
          KurationScreen(),
          // KurationFeedScreen(),
          KommunityScreen(),
          KameraScreen(),
          MyScreen(),
        ],
      ),
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        decoration:
            (_currentIndex != 1)
                ? BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: GrayScale.black_20,
                      offset: Offset(0, 32),
                      blurRadius: 64,
                    ),
                  ],
                )
                : null,
        child: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.jumpToPage(index);
          },
        ),
      ),
    );
  }
}
