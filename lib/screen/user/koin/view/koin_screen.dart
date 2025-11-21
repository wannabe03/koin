import 'package:flutter/material.dart';
import '../widget/koin_banner.dart';
import '../widget/koin_menu.dart';
import '../widget/koin_community.dart';

class KoinScreen extends StatelessWidget {
  const KoinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<BannerData> banners = [
      const BannerData(
        imagePath: 'asset/img/test/Banner_1.png',
        category: 'K-uration',
        title: 'How to use Koin',
        subtitle: 'Read now ->',
      ),
      const BannerData(
        imagePath: 'asset/img/test/Banner_1.png',
        category: 'Recommended',
        title: 'Top Kuration',
        subtitle: 'Read now ->',
      ),
      const BannerData(
        imagePath: 'asset/img/test/Banner_1.png',
        category: 'New Features',
        title: 'Latest Update',
        subtitle: 'Read now ->',
      ),
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          spacing: 16,
          children: [
            KoinBanner(banners: banners),
            const KoinMenu(),
            const KoinCommunity(),
          ],
        ),
      ),
    );
  }
}
