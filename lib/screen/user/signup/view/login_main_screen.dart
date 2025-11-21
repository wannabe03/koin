import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/login_email_screen.dart';
import 'package:koin/screen/user/signup/view/signup_info_screen.dart';
import 'package:koin/screen/user/signup/view/signup_personal_details_screen.dart';
import 'package:koin/screen/user/signup/view/signup_reset_password_screen.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';
import 'package:koin/screen/user/signup/widget/social_login_button.dart';

class MainLoginScreen extends StatelessWidget {
  const MainLoginScreen({super.key});

  Widget _buildLoginButtons(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        // Google login
        SocialLoginButton(
          label: Text(
            "Login with Google",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: PRIMARY_COLOR,
            ),
          ),
          hasIcon: true,
          icon: Image.asset(
            "asset/img/icon/google_logo.png",
            width: 14,
            height: 14,
          ),
          backgroundColor: GrayScale.white,
          borderColor: PRIMARY_COLOR,
          onPressed: () {},
        ),

        SocialLoginButton(
          label: Text(
            "Login with Kakao",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: GrayScale.black,
            ),
          ),
          hasIcon: true,
          icon: Image.asset(
            "asset/img/icon/kakao_logo.png",
            width: 14,
            height: 14,
          ),
          backgroundColor: KAKAO_COLOR,
          onPressed: () {},
        ),

        SocialLoginButton(
          label: Text(
            "Login with Email",
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: GrayScale.white,
            ),
          ),
          hasIcon: false,

          backgroundColor: PRIMARY_COLOR,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const LoginEmailScreen()),
            );
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      hasSubmitButton: false,
      hasBottomTextButton: true,
      bottomGuideText: "Forgot your account?",
      bottomTextLabel: "Find My Account",
      bottomNextRoute: MaterialPageRoute(
        builder: (context) => ResetPasswordScreen(),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            spacing: 24,
            children: [
              // Social Login Buttons
              _buildLoginButtons(context),
              // SIGN UP BUTTON
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
                  "Sign Up",
                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                    color: PRIMARY_COLOR,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const PersonalDetailsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          // FIND MY ACCOUNT
        ],
      ),
    );
  }
}
