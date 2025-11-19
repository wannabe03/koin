import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class KurationTabs extends StatelessWidget {
  final TabController controller;
  final List<String> tabs;

  const KurationTabs({super.key, required this.controller, required this.tabs});

  // TODO: align left
  @override
  Widget build(BuildContext context) {
    return TabBar(
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
      tabs: tabs.map((name) => Tab(text: name)).toList(),
    );
  }
}
