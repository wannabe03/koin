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
      padding: EdgeInsetsGeometry.fromLTRB(0, 8, 0, 0),
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
            obscureText: widget.type == InputType.password && !_showPassword,

            keyboardType: keyboardType,
            cursorColor: GrayScale.black,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              isDense: true,
              hintText: (widget.hintText),
              hintStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w500,
                color: GrayScale.gray400,
              ),

              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: PRIMARY_COLOR, width: 2),
              ),
              suffixIconConstraints: BoxConstraints(
                maxWidth: 18,
                maxHeight: 18,
              ),
              suffixIcon:
                  widget.hasSuffixIcon != null
                      ? IconButton(
                        style: IconButton.styleFrom(padding: EdgeInsets.all(0)),
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
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
