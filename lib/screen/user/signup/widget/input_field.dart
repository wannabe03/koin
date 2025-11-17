import 'package:flutter/material.dart';
import 'package:koin/common/const/colors.dart';

enum InputType { email, password, common }

class InputField extends StatefulWidget {
  const InputField({
    super.key,
    required this.inputTextController,
    required this.labelText,
    required this.type,
    this.hasSuffixIcon,
    this.isEmailValid,

    this.isPasswordValid,
    this.hintText,
  });

  final TextEditingController inputTextController;
  final String labelText;
  final InputType type;
  final String? hintText;
  final bool? isEmailValid;

  final bool? isPasswordValid;

  final bool? hasSuffixIcon;

  @override
  State<StatefulWidget> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _showPassword = false;
  @override
  void initState() {
    super.initState();
  }

  void _toggleVisibility() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }

  // TODO: if input type is email, add email validation

  @override
  Widget build(BuildContext context) {
    assert(
      !(widget.type == InputType.email && widget.isEmailValid == null) ||
          !(widget.type == InputType.password &&
              widget.isPasswordValid == null &&
              widget.hasSuffixIcon == null),
    );
    TextInputType keyboardType;

    if (widget.type == InputType.email) {
      keyboardType = TextInputType.emailAddress;
    } else if (widget.type == InputType.password) {
      keyboardType = TextInputType.visiblePassword;
    } else {
      keyboardType = TextInputType.text;
    }

    return Padding(
      padding: EdgeInsetsGeometry.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w500,
              color: PRIMARY_COLOR,
            ),
          ),
          TextField(
            controller: widget.inputTextController,
            obscureText: !_showPassword,

            keyboardType: keyboardType,
            cursorColor: GrayScale.black,
            // TODO: apply new style?
            style: const TextStyle(color: GrayScale.black),
            decoration: InputDecoration(
              hintText: (widget.hintText),
              hintStyle: Theme.of(
                context,
              ).textTheme.headlineSmall?.copyWith(color: GrayScale.gray400),

              // NOTE: label makes small title which is animated when focused
              // labelText: widget.labelText,
              // labelStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              //   fontWeight: FontWeight.w500,
              //   color: PRIMARY_COLOR,
              // ),

              // floatingLabelStyle: TextStyle(color: PRIMARY_COLOR),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
              ),
              suffixIcon:
                  widget.hasSuffixIcon != null
                      ? IconButton(
                        splashColor: Colors.transparent,
                        enableFeedback: false,
                        hoverColor: Colors.transparent,
                        onPressed: () => _toggleVisibility(),
                        icon: Image.asset(
                          'asset/img/icon/toggle_show_password.png',
                          width: 16,
                        ),
                      )
                      : null,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
