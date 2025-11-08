import 'package:flutter/material.dart';
import 'package:koin/screen/user/kuration/view/kuration_feed_screen.dart';

class KurationGrid extends StatelessWidget {
  final Map<String, String> items;
  const KurationGrid({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    final itemList = items.entries.toList();

    return GridView.builder(
      padding: const EdgeInsets.all(16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.8,
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final item = itemList[index];
        final String title = item.key;
        final String imagePath = item.value;

        return _buildGridItem(
          context: context,
          title: title,
          imagePath: imagePath,
        );
      },
    );
  }

  Widget _buildGridItem({
    required BuildContext context,
    required String title,
    required String imagePath,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => KurationFeedScreen(title: title),
          ),
        );
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(imagePath, fit: BoxFit.cover),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withValues(alpha: 0.7),
                    Colors.transparent,
                  ],
                  begin: Alignment.bottomCenter,
                  end: const Alignment(0.0, 0.2),
                ),
              ),
            ),
            Positioned(
              bottom: 12,
              left: 12,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Pretendard',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
