import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class BannerData {
  final String imagePath;
  final String category;
  final String title;
  final String subtitle;

  const BannerData({
    required this.imagePath,
    required this.category,
    required this.title,
    required this.subtitle,
  });
}

class KoinBanner extends StatefulWidget {
  final List<BannerData> banners;

  const KoinBanner({super.key, required this.banners});

  @override
  State<KoinBanner> createState() => _KoinBannerState();
}

class _KoinBannerState extends State<KoinBanner> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildBannerImage(String imagePath) {
    if (imagePath.endsWith('.svg')) {
      return SvgPicture.asset(
        imagePath,
        fit: BoxFit.cover,
        placeholderBuilder:
            (BuildContext context) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withValues(alpha: 0.8),
                    Colors.purple.withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(Icons.image, color: Colors.white, size: 50),
              ),
            ),
      );
    } else {
      return Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder:
            (context, error, stackTrace) => Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.blue.withValues(alpha: 0.8),
                    Colors.purple.withValues(alpha: 0.8),
                  ],
                ),
              ),
              child: const Center(
                child: Icon(Icons.image, color: Colors.white, size: 50),
              ),
            ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth * 0.75;
    return SizedBox(
      width: double.infinity,
      height: bannerHeight,
      child: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children:
                widget.banners.map((banner) {
                  return SizedBox(
                    width: double.infinity,
                    height: bannerHeight,
                    child: _buildBannerImage(banner.imagePath),
                  );
                }).toList(),
          ),
          Positioned.fill(
            child: IgnorePointer(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      const Color(0x0001002C).withValues(alpha: 0.0),
                      const Color(0x00000000).withValues(alpha: 0.6),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            bottom: 24,
            child: Column(
              spacing: 6,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.banners[_currentPage].category,
                      style: Theme.of(
                        context,
                      ).textTheme.titleMedium?.copyWith(color: GrayScale.white),
                    ),
                    // Title
                    Text(
                      widget.banners[_currentPage].title,
                      style: Theme.of(context).textTheme.displayMedium
                          ?.copyWith(height: 45 / 32, color: GrayScale.white),
                    ),
                  ],
                ),

                // Subtitle
                Row(
                  children: [
                    Text(
                      widget.banners[_currentPage].subtitle,
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w500,
                        color: GrayScale.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Positioned(
            right: 16,
            bottom: 18,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                widget.banners.length,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color:
                        _currentPage == index
                            ? PRIMARY_COLOR
                            : Colors.white.withValues(alpha: 0.7),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
