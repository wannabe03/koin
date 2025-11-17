import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

enum SocialType { kakao, google, email }

class SocialLoginButton extends StatelessWidget {
  const SocialLoginButton({
    super.key,
    required this.label,
    required this.hasIcon,
    required this.backgroundColor,
    required this.onPressed,
    this.borderColor,
    this.icon,
  });

  final Text label;
  final bool hasIcon;
  final Color backgroundColor;
  final Color? borderColor;
  final Function() onPressed;
  final Image? icon;

  @override
  Widget build(BuildContext context) {
    assert(
      !hasIcon || icon != null,
      'If hasIcon is true, an icon widget must be provided.',
    );

    return ElevatedButton(
      onPressed: onPressed,

      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        backgroundColor: backgroundColor,
        side: BorderSide(
          width: 1,
          color: borderColor != null ? borderColor! : backgroundColor,
        ),
        minimumSize: const Size(double.infinity, 52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
        // TODO: enable/disable interaction animation?
        elevation: 0,
        overlayColor: Colors.transparent,
        shadowColor: Colors.transparent,
        enableFeedback: false,
        splashFactory: NoSplash.splashFactory,
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 8,
        children: [if (hasIcon) icon!, label],
      ),
    );
  }
}
