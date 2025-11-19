import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class KurationFeatured extends StatelessWidget {
  final PageController controller;
  const KurationFeatured({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 293,
      child: PageView(
        controller: controller,
        children: [
          _buildFeaturedItem(
            context: context,
            imagePath: 'asset/img/examples/seoul_tour.jpg',
            subtitle: 'Seoul my soul',
            title: 'Seoul Café Tour',
            actionText: 'Read →',
          ),
          _buildFeaturedItem(
            context: context,
            imagePath: 'asset/img/examples/restaurant_guide.jpg',
            subtitle: 'Tasty Journey',
            title: 'Restaurant Guide',
            actionText: '바로가기 →',
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedItem({
    context,
    required String imagePath,
    required String subtitle,
    required String title,
    required String actionText,
  }) {
    return GestureDetector(
      onTap: () {},
      child: ClipRRect(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.6),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.center,
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: GrayScale.white),
                      ),
                      Text(
                        title,
                        style: Theme.of(context).textTheme.displayMedium
                            ?.copyWith(color: GrayScale.white),
                      ),
                    ],
                  ),

                  Text(
                    actionText,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // TODO: add page indicator
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
