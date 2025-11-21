import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

/// Template for [gray tip + underlined text button] combination. when textbutton is clicked, push to next route.
/// Usage: "Find your account" and "Terms of Use"
class GuidedTextButton extends StatelessWidget {
  const GuidedTextButton({
    super.key,
    required this.nextRoute,
    required this.guideText,
    required this.label,
  });
  final MaterialPageRoute nextRoute;
  final String guideText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.fromLTRB(0, 16, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 6,
        children: [
          Text(
            guideText,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: GrayScale.gray500,
              fontSize: 12,
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.all(0),
              overlayColor: Colors.transparent,
              elevation: 0,
              splashFactory: NoSplash.splashFactory,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: Text(
              label,
              style: Theme.of(context).textTheme.labelLarge?.copyWith(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(nextRoute);
            },
          ),
        ],
      ),
    );
  }
}
