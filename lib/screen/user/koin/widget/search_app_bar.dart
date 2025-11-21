import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:koin/common/const/colors.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      surfaceTintColor: Colors.white,
      scrolledUnderElevation: 0,
      title: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container(
          height: 48,
          decoration: BoxDecoration(
            color: GrayScale.gray100,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    fontWeight: FontWeight.w500,
                    color: GrayScale.black,
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    hintText: '검색어를 입력해주세요.',
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                      color: GrayScale.gray300,
                    ),
                    border: InputBorder.none,
                  ),
                  cursorColor: Colors.black,
                ),
              ),
              SvgPicture.asset('asset/img/icon/Search_Black.svg'),
              SizedBox(width: 20),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(68);
}
