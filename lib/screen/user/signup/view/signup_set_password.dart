import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/signup_info_screen.dart';
import 'package:koin/screen/user/signup/view/terms_of_use.dart';
import 'package:koin/screen/user/signup/widget/guided_textbutton.dart';
import 'package:koin/screen/user/signup/widget/input_field.dart';

class SetPasswordScreen extends StatefulWidget {
  const SetPasswordScreen({super.key});
  @override
  State<StatefulWidget> createState() => _SetPasswordScreenState();
}

class _SetPasswordScreenState extends State<SetPasswordScreen> {
  final _passwordController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  bool showPassword = false;
  bool showPasswordConfirm = false;
  bool isPasswordConfirmed = false;

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_updateState);
    _passwordConfirmController.addListener(_updateState);
  }

  void _updateState() {
    setState(() {
      _confirmPassword();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
  }

  // Temporary confirmation logic
  void _confirmPassword() {
    if (_passwordConfirmController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty &&
        _passwordConfirmController.text.compareTo(_passwordController.text) ==
            0) {
      setState(() {
        isPasswordConfirmed = true;
      });
    } else {
      isPasswordConfirmed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GradientContainer(
      title: TextSpan(
        style: Theme.of(context).textTheme.headlineLarge,
        children: [
          TextSpan(text: "Protect your account by\n"),
          TextSpan(
            text: "setting a password.\n",
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ],
      ),
      hasSubmitButton: true,
      isSubmitEnabled: isPasswordConfirmed,
      submitCallback:
          () => Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => SignUpInfoScreen())),
      submitLabel: "Next",

      hasBottomTextButton: false,
      bottomNextRoute: MaterialPageRoute(
        builder: (context) => TermsOfUseScreen(),
      ),
      bottomGuideText: "Do you have any question?",
      bottomTextLabel: "Terms of Use",
      child: Column(
        spacing: 16,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(height: 16),
          InputField(
            inputTextController: _passwordController,
            labelText: 'New Password',
            type: InputType.password,
            hasSuffixIcon: true,
          ),
          InputField(
            inputTextController: _passwordConfirmController,
            labelText: 'Confirm Password',
            type: InputType.password,
            hasSuffixIcon: true,
          ),
        ],
      ),
    );
  }
}
