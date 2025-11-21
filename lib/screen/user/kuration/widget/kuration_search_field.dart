import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class KurationSearchField extends StatelessWidget {
  final VoidCallback? onAlarmTap;

  const KurationSearchField({super.key, this.onAlarmTap});

  @override
  Widget build(BuildContext context) {
    bool hasNewAlert = false;
    return Container(
      color: GrayScale.white,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  color: GrayScale.gray100,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: '게시글 검색',
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: GrayScale.gray300,
                      fontWeight: FontWeight.w500,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: onAlarmTap,
              icon:
                  hasNewAlert
                      ? SvgPicture.asset(
                        'asset/img/icon/Alarm_On.svg',
                        height: 32,
                      )
                      : SvgPicture.asset(
                        'asset/img/icon/Alarm_Off.svg',
                        height: 24,
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
