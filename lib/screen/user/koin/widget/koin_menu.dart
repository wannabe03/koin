import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'menu_icon_button.dart';

class KoinMenu extends StatelessWidget {
  const KoinMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Color.fromARGB(127, 206, 225, 255), GrayScale.white],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            offset: const Offset(0, 2),
            blurRadius: 10,
            spreadRadius: 0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 8),
        child: Column(
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: Theme.of(
                  context,
                ).textTheme.headlineMedium?.copyWith(fontSize: 16),
                children: <TextSpan>[
                  TextSpan(text: '내 메뉴 '),
                  TextSpan(
                    text: 'My Menu',
                    style: TextStyle(color: GrayScale.gray300),
                  ),
                ],
              ),
            ),
            GridView.count(
              padding: EdgeInsets.symmetric(horizontal: 12),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 4,
              mainAxisSpacing: 0,
              crossAxisSpacing: 12,
              children: const [
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_1.svg',
                  label: 'Chanel...',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_1.svg',
                  label: 'Editor2y',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_2.svg',
                  label: '행정',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_2.svg',
                  label: '뉴스',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_3.svg',
                  label: '어학',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_4.svg',
                  label: '주거서류',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_5.svg',
                  label: '생활',
                ),
                MenuIconButton(
                  imagePath: 'asset/img/icon/Menu_6.svg',
                  label: 'Setting',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
