import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';
import 'kuration_view.dart';
import '../model/kuration_item.dart';

class KurationBanner extends StatelessWidget {
  const KurationBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final sample = [
      KurationItem(
        assetPath: 'asset/img/test/Kuration_1.png',
        title: '강릉 놀거리 5',
      ),
      KurationItem(assetPath: 'asset/img/test/Kuration_1.png', title: '강원도 특집'),
    ];

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 12, bottom: 12, left: 16),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: Theme.of(context).textTheme.headlineMedium,
                    children: [
                      TextSpan(text: '큐레이션 '),
                      TextSpan(
                        text: 'K-uration',
                        style: TextStyle(color: GrayScale.gray300),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Text(
                    'All →',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: PRIMARY_COLOR,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            KurationView(items: sample),
          ],
        ),
      ),
    );
  }
}
