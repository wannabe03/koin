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
      width: 36,
      height: 36,
      textStyle: const TextStyle(fontSize: 22, color: GrayScale.gray500),
      decoration: BoxDecoration(
        color: GrayScale.gray200,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.transparent),
      ),
    );

    return GradientContainer(
      title: TextSpan(
        style: Theme.of(context).textTheme.headlineLarge,
        children: [
          const TextSpan(text: 'We sent numbers to your email.\n'),
          TextSpan(
            text: 'Please enter the code ',
            style: TextStyle(color: PRIMARY_COLOR),
          ),
          TextSpan(text: 'to verify your identity.\n'),
        ],
      ),
      hasSubmitButton: true,
      submitCallback:
          () => Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const SetPasswordScreen()),
          ),
      submitLabel: "Next",
      isSubmitEnabled: pinController.text.isNotEmpty,

      hasBottomTextButton: true,
      bottomNextRoute: MaterialPageRoute(
        builder: (context) => TermsOfUseScreen(),
      ),
      bottomGuideText: "Do you have any questions?",
      bottomTextLabel: "Terms of Use",

      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Pinput(
                  obscureText: true,
                  controller: pinController,
                  length: 4,
                  submittedPinTheme: PinTheme(
                    width: 40,
                    height: 40,
                    textStyle: Theme.of(
                      context,
                    ).textTheme.headlineLarge?.copyWith(color: PRIMARY_COLOR),
                    decoration: BoxDecoration(
                      color: SUB_PRIMARY_COLOR,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  defaultPinTheme: PinTheme(
                    width: 40,
                    height: 40,
                    textStyle: Theme.of(context).textTheme.headlineLarge
                        ?.copyWith(color: GrayScale.gray500),
                    decoration: BoxDecoration(
                      color: GrayScale.gray200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  focusedPinTheme: PinTheme(
                    width: 40,
                    height: 40,
                    textStyle: Theme.of(context).textTheme.headlineLarge
                        ?.copyWith(color: GrayScale.gray500),
                    decoration: BoxDecoration(
                      border: Border.all(color: PRIMARY_COLOR),
                      color: GrayScale.gray200,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  onCompleted: (pin) {},
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 48),
                  child: Container(
                    height: 1.5,
                    width: double.infinity,
                    color: PRIMARY_COLOR,
                  ),
                ),
                Column(
                  spacing: 8,
                  children: [
                    Text(
                      'Not received the code?',
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: GrayScale.gray400,
                      ),
                    ),
                    SizedBox(
                      width: 280,
                      child: ElevatedButton(
                        onPressed: () => {},
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(10),
                          ),
                          backgroundColor: PRIMARY_COLOR,
                          disabledBackgroundColor: GrayScale.midgrey,
                          elevation: 0,
                          shadowColor: Colors.transparent,
                          splashFactory: NoSplash.splashFactory,
                        ),
                        child: Text(
                          'Resend the code',
                          style: Theme.of(context).textTheme.labelLarge
                              ?.copyWith(color: GrayScale.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Spacer(flex: 1),
        ],
      ),
    );
  }
}
