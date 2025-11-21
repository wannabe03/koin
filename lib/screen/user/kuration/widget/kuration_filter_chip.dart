import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

// temp
enum SortOption { latest, popular }

class KurationFilterChip extends StatelessWidget {
  final SortOption sortOption;
  const KurationFilterChip({super.key, required this.sortOption});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      color: PRIMARY_COLOR,
      child: Padding(
        padding: EdgeInsets.fromLTRB(12, 15, 20, 14),
        child: Text(
          sortOption.name,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge?.copyWith(color: GrayScale.white),
        ),
      ),
    );
  }
}
