import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/signup_set_password.dart';
import 'package:koin/screen/user/signup/view/terms_of_use.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';
import 'package:koin/screen/user/signup/widget/page_indicator.dart';
import 'package:pinput/pinput.dart';
import 'package:koin/screen/user/signup/view/signup_reset_password_screen.dart';

class SecurityCodeScreen extends StatefulWidget {
  final String email;

  const SecurityCodeScreen({super.key, required this.email});

  @override
  State<SecurityCodeScreen> createState() => _SecurityCodeScreenState();
}

class _SecurityCodeScreenState extends State<SecurityCodeScreen> {
  final pinController = TextEditingController();

  @override
  void initState() {
    super.initState();
    pinController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 22, color: GrayScale.gray500),
      decoration: BoxDecoration(
        color: GrayScale.gray200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return GradientContainer(
      hasSubmitButton: true,
      submitCallback:
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SetPasswordScreen()),
          ),
      submitLabel: "Next",
      isSubmitEnabled: pinController.text.isNotEmpty,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(flex: 3),
          RichText(
            textAlign: TextAlign.start,
            text: TextSpan(
              style: Theme.of(context).textTheme.headlineLarge,
              children: [
                const TextSpan(text: 'We sent numbers to your email.\n'),
                // TextSpan(
                //   text: widget.email,
                //   style: const TextStyle(fontWeight: FontWeight.bold),
                // ),
                TextSpan(
                  text: 'Please enter the code ',
                  style: TextStyle(color: PRIMARY_COLOR),
                ),
                TextSpan(text: 'to verify your identity.'),
              ],
            ),
          ),

          const Spacer(flex: 4),
          Pinput(
            controller: pinController,
            length: 4,
            defaultPinTheme: defaultPinTheme,
            focusedPinTheme: defaultPinTheme.copyWith(
              decoration: defaultPinTheme.decoration!.copyWith(
                border: Border.all(color: PRIMARY_COLOR),
              ),
            ),
            onCompleted: (pin) {},
          ),
          const Spacer(flex: 2),
          Column(
            spacing: 8,
            children: [
              Text(
                'Not received the code?',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(color: GrayScale.gray400),
              ),
              SizedBox(
                width: 280,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                    // TODO: apply new color: midgrey
                    backgroundColor: GrayScale.gray300,
                    elevation: 0,
                    splashFactory: NoSplash.splashFactory,
                  ),
                  child: Text(
                    'Resend the code',
                    style: Theme.of(
                      context,
                    ).textTheme.labelLarge?.copyWith(color: GrayScale.white),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(flex: 8),
          GuidedTextButton(
            nextRoute: MaterialPageRoute(
              builder: (context) => TermsOfUseScreen(),
            ),
            guideText: "Do you have any questions?",
            label: "Terms of Use",
          ),
          const Spacer(flex: 3),
        ],
      ),
    );
  }
}
