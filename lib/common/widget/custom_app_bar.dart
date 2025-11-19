import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'custom_icon_button.dart';
import 'package:flutter_svg/svg.dart';
import '../../screen/user/koin/view/search_screen.dart';

AppBar customAppBar(BuildContext context, {Function(int)? onTabSelected}) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0,
    automaticallyImplyLeading: false,
    title: Row(
      spacing: 8,
      children: [
        SvgPicture.asset('asset/img/icon/main_logo.svg', width: 32),
        Text(
          'Koin',
          style: Theme.of(
            context,
          ).textTheme.displaySmall?.copyWith(color: PRIMARY_COLOR),
        ),
      ],
    ),
    actionsPadding: EdgeInsets.only(right: 8),
    actions: [
      CustomIconButton(
        imagePath: 'asset/img/icon/Search.svg',
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SearchScreen(onTabSelected: onTabSelected),
            ),
          );
        },
      ),
      CustomIconButton(
        imagePath: 'asset/img/icon/Alarm_Off.svg',
        onPressed: () {},
      ),
    ],
  );
}
