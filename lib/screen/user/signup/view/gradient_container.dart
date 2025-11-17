import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/widget/submit_button.dart';

class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.child,
    required this.hasSubmitButton,
    this.submitCallback,
    this.submitLabel,
    this.isSubmitEnabled,
  });
  final Widget? child;
  final bool hasSubmitButton;
  final Function()? submitCallback;
  final String? submitLabel;
  final bool? isSubmitEnabled;

  @override
  Widget build(BuildContext context) {
    assert(
      !hasSubmitButton ||
          (submitCallback != null &&
              submitLabel != null &&
              isSubmitEnabled != null),
      "If hasSubmitButton is true, submitCallback and label and isEnabled properties should be provided.",
    );
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [GRADIENT_COLOR, GrayScale.white],
                begin: Alignment.topLeft,
                end: Alignment.center,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: child,
            ),
          ),
          if (hasSubmitButton)
            Positioned(
              bottom: 0,
              left: 0,
              child: SubmitButton(
                onPressed: submitCallback!,
                label: submitLabel!,
                isEnabled: isSubmitEnabled!,
              ),
            ),
        ],
      ),
    );
  }
}
