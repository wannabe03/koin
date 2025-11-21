import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';
import 'package:koin/screen/user/signup/widget/submit_button.dart';

/// Basic structure for screens used in signup/in flow.
class GradientContainer extends StatelessWidget {
  const GradientContainer({
    super.key,
    this.child,
    required this.hasSubmitButton,
    required this.hasBottomTextButton,
    this.title,
    this.submitCallback,
    this.submitLabel,
    this.isSubmitEnabled,
    this.bottomTextCallback,
    this.bottomNextRoute,
    this.bottomGuideText,
    this.bottomTextLabel,
  });
  final TextSpan? title;
  final Widget? child;

  final bool hasBottomTextButton;
  final MaterialPageRoute? bottomNextRoute;
  final String? bottomGuideText;
  final String? bottomTextLabel;
  final Function()? bottomTextCallback;

  final bool hasSubmitButton;
  final Function()? submitCallback;
  final String? submitLabel;
  final bool? isSubmitEnabled;

  @override
  Widget build(BuildContext context) {
    assert(
      !hasBottomTextButton ||
          (bottomGuideText != null &&
              bottomNextRoute != null &&
              bottomGuideText != null &&
              bottomTextLabel != null),
      "If hasBottomTextButton is true, bottomTextCallback and bottomTextButton should be provided.",
    );
    assert(
      !hasSubmitButton ||
          (submitCallback != null &&
              submitLabel != null &&
              isSubmitEnabled != null),
      "If hasSubmitButton is true, submitCallback and label and isEnabled properties should be provided.",
    );
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [GRADIENT_COLOR, GrayScale.white],
            begin: Alignment.topLeft,
            end: Alignment.center,
          ),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,

                  children: [
                    title != null
                        // Using top area as title area
                        ? Expanded(
                          flex: 3,
                          child: SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(flex: 1),
                                RichText(text: title!),
                              ],
                            ),
                          ),
                        )
                        // Using top area as logo area
                        : Expanded(
                          flex: 12,
                          child: Column(
                            children: [
                              Spacer(flex: 4),
                              Expanded(
                                flex: 6,
                                child: SvgPicture.asset(
                                  'asset/img/icon/main_logo.svg',

                                  width: 168,
                                ),
                              ),
                            ],
                          ),
                        ),
                    // child widget area
                    Expanded(
                      flex: 8,
                      child: SizedBox(
                        width: double.infinity,
                        child: child ?? const SizedBox(),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                // color: Colors.amber,
                child: Column(
                  spacing: 12,
                  children: [
                    if (hasBottomTextButton)
                      GuidedTextButton(
                        nextRoute: bottomNextRoute!,
                        guideText: bottomGuideText!,
                        label: bottomTextLabel!,
                      ),
                    (hasSubmitButton)
                        ? SubmitButton(
                          onPressed: submitCallback!,
                          label: submitLabel!,
                          isEnabled: isSubmitEnabled!,
                        )
                        : SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
