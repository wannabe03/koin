import 'package:flutter/material.dart';
import 'package:koin/common/widget/custom_app_bar.dart';
import 'package:koin/common/widget/custom_bottom_navigation_bar.dart';
import 'package:koin/screen/user/koin/view/koin_screen.dart';
import 'package:koin/screen/user/kuration/view/kuration_screen.dart';
import 'package:koin/screen/user/kommunity/view/kommunity_screen.dart';
import 'package:koin/screen/user/kamera/view/kamera_screen.dart';
import 'package:koin/screen/user/mypage/view/my_screen.dart';

class HomeScreen extends StatefulWidget {
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
          KommunityScreen(),
          KameraScreen(),
          MyScreen(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
          _pageController.jumpToPage(index);
        },
      ),
    );
  }
}
