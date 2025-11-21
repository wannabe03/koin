import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/kuration/widget/kuration_filter_chip.dart';

class KurationTabs extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;
  final bool hasSortButton;
  final bool showShadow;
  final bool showShadowBottomOnly;
  final SortOption? sortOption;

  const KurationTabs({
    super.key,
    required this.controller,
    required this.tabs,
    required this.hasSortButton,
    required this.showShadow,
    required this.showShadowBottomOnly,
    this.sortOption,
  });

  @override
  Widget build(BuildContext context) {
    assert(!hasSortButton || sortOption != null);
    return Container(
      decoration: BoxDecoration(
        color: GrayScale.white,
        boxShadow: [
          if (showShadow && !showShadowBottomOnly)
            BoxShadow(
              color: GrayScale.black_5,
              offset: Offset(0, 2),
              blurRadius: 10,
            ),
          if (showShadow && showShadowBottomOnly)
            BoxShadow(
              color: GrayScale.black_5,
              offset: Offset(0, 10),
              blurRadius: 10,
            ),
        ],
      ),
      child: Stack(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            padding: EdgeInsets.symmetric(horizontal: 16),
            splashFactory: NoSplash.splashFactory,
            controller: controller,
            isScrollable: true,
            labelColor: PRIMARY_COLOR,
            unselectedLabelColor: GrayScale.gray500,
            indicatorColor: Colors.transparent,
            indicatorSize: TabBarIndicatorSize.label,

            labelStyle: Theme.of(
              context,
            ).textTheme.titleLarge?.copyWith(color: PRIMARY_COLOR),
            unselectedLabelStyle: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            tabs:
                hasSortButton
                    ? [
                      // KurationFilterChip(sortOption: sortOption!),
                      ...tabs.map((name) => Tab(text: name, height: 42)),
                    ].toList()
                    : tabs.map((name) => Tab(text: name, height: 42)).toList(),
          ),
        ],
      ),
    );
  }
}
