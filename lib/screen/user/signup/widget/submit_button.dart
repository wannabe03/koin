import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

class SubmitButton extends StatelessWidget {
  final Function() onPressed;
  final bool isEnabled;
  final String label;

  const SubmitButton({
    super.key,
    required this.onPressed,
    required this.label,
    required this.isEnabled,
  });

  void debug(context) {
    debugPrint(
      "${MediaQuery.of(context).size.width} ${MediaQuery.of(context).size.height}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 85,
      decoration: BoxDecoration(
        gradient:
            isEnabled
                ? LinearGradient(
                  colors: [PRIMARY_COLOR, SECONDARY_COLOR],
                  stops: [0, 1],
                )
                : LinearGradient(
                  colors: [GrayScale.gray500, GrayScale.gray500],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: ContinuousRectangleBorder(),
          maximumSize: Size(double.infinity, 85),
          padding: const EdgeInsets.fromLTRB(40, 16, 40, 40),
          backgroundColor: Colors.transparent,
          overlayColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          splashFactory: NoSplash.splashFactory,
        ),
        onPressed: isEnabled ? onPressed : null,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w500,
            color: GrayScale.white,
          ),
        ),
      ),
    );
  }
}
