import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';
import 'package:koin/screen/user/signup/view/gradient_container.dart';
import 'package:koin/screen/user/signup/view/terms_of_use.dart';
import 'package:koin/screen/user/signup/view/signup_security_code_screen.dart';
import 'package:koin/screen/user/signup/widget/input_field.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({super.key});

  @override
  State<PersonalDetailsScreen> createState() => _PersonalDetailsScreenState();
}

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen> {
  final _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateState);
  }

  // TODO: fix to check if all inputs are not empty
  void _updateState() {
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onPressed() {
    final email = _emailController.text;
    if (email.isEmpty || !validateEmail(_emailController.text)) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('올바른 이메일을 입력해주세요.')));
      return;
    }
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SecurityCodeScreen(email: email)),
    );
  }

  bool validateEmail(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    ).hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    final bool isButtonEnabled = _emailController.text.isNotEmpty;
    return GradientContainer(
      title: TextSpan(
        style: Theme.of(
          context,
        ).textTheme.headlineLarge?.copyWith(height: 32 / 24),
        children: <TextSpan>[
          TextSpan(text: "To start Koin,\nPlease enter "),
          TextSpan(
            text: "your information.\n\n",
            style: TextStyle(color: PRIMARY_COLOR),
          ),
        ],
      ),
      hasSubmitButton: true,
      submitCallback: _onPressed,
      submitLabel: "Next",
      isSubmitEnabled: isButtonEnabled,

      hasBottomTextButton: true,
      bottomGuideText: "Do you have any questions?",
      bottomTextLabel: "Terms of Use",
      bottomNextRoute: MaterialPageRoute(
        builder: (context) => TermsOfUseScreen(),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            spacing: 16,
            children: [
              InputField(
                labelText: 'First name',
                inputTextController: TextEditingController(),
                type: InputType.common,
              ),
              InputField(
                labelText: 'Last name',
                inputTextController: TextEditingController(),
                type: InputType.common,
              ),
              InputField(
                inputTextController: TextEditingController(),
                labelText: 'Birthday',
                type: InputType.common,
                hintText: 'DD/MM/YYYY',
              ),
              InputField(
                inputTextController: TextEditingController(),
                labelText: 'Gender',
                type: InputType.common,
              ),
              InputField(
                inputTextController: _emailController,
                labelText: 'Email',
                type: InputType.email,
                isEmailValid: validateEmail(_emailController.text),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
