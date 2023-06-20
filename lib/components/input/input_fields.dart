import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

// TextFormField

// Login
class LoginInputField extends StatefulWidget {
  final bool obsureText;
  final String labelText;
  final press;

  const LoginInputField({
    Key? key,
    required this.labelText,
    required this.press,
    this.obsureText = false,
  }) : super(key: key);

  @override
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        SizedBox(height: defaultSize * 2),
        TextMedium(
          title: widget.labelText,
          color: kBlack60,
          weight: FontWeight.w500,
        ),
        SizedBox(height: defaultSize * .5),

        // Form Input Field - basically an input field
        buildFormInputField(),
      ],
    );
  }

  // Form Field
  TextFormField buildFormInputField() {
    return TextFormField(
      obscureText: widget.obsureText,
      decoration: buildInputDecoration(),
      style: buildInputTextStyle(),
      validator: (value) => validateInputField(value),
      onSaved: (value) => widget.press(value),
    );
  }

  // Style - our form fields border styles
  OutlineInputBorder buildBorderStyle() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(defaultSize * 2),
      borderSide: BorderSide(width: 5, color: kBlue.withOpacity(.01)),
    );
  }

  // Style - our form fields input decoration
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: kBlue.withOpacity(.1),
      contentPadding: EdgeInsets.symmetric(
          horizontal: defaultSize * 2, vertical: defaultSize * 2),
      enabledBorder: buildBorderStyle(),
      focusedBorder: buildBorderStyle(),
      errorBorder: buildBorderStyle(),
      focusedErrorBorder: buildBorderStyle(),
    );
  }

  // Style - our form fields input text styles
  TextStyle buildInputTextStyle() {
    return TextStyle(
      fontSize: defaultSize * 1.8,
      fontWeight: FontWeight.w500,
      color: kBlack60,
    );
  }

  // Validator - validates the data entered into our input form field
  String? validateInputField(value) {
    if (value!.isEmpty) {
      return "Please enter your ${widget.labelText}";
    }
    return null;
  }
}

// Settings
class InputFieldSettings extends StatefulWidget {
  const InputFieldSettings({
    Key? key,
    this.fieldName = "",
    this.maxLines = 1,
    required this.press,
  }) : super(key: key);

  final int maxLines;
  final String fieldName;
  final Function(String key, String value) press;

  @override
  State<InputFieldSettings> createState() => _InputFieldSettingsState();
}

class _InputFieldSettingsState extends State<InputFieldSettings> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: false,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.fieldName,
      ),
      style: TextStyle(),
      validator: (value) {
        return null;
      },
      onSaved: (value) {
        if (value != null && value.isNotEmpty) {
          widget.press(widget.fieldName, value.trim());
        }
      },
    );
  }
}

// TextField
class AppsTextField extends StatefulWidget {
  const AppsTextField({
    Key? key,
    this.prefixIcon,
    this.showCancel = true,
    this.hintText = "",
    this.borderRadius = 10,
    required this.onSubmitPress,
  }) : super(key: key);

  final IconData? prefixIcon;
  final bool showCancel;
  final String hintText;
  final double borderRadius;
  final Function(String value) onSubmitPress;

  @override
  State<AppsTextField> createState() => _AppsTextFieldState();
}

class _AppsTextFieldState extends State<AppsTextField> {
  var _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: "");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  late bool hideCancel = true;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 1,
      textInputAction: TextInputAction.search,
      style: getAppsTextStyle(fontWeight: FontWeight.w400, color: kBlack80),
      onSubmitted: widget.onSubmitPress,
      onChanged: hideOrRevealCancel,
      decoration: buildDecoration(),
    );
  }

  InputDecoration buildDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: defaultSize),
      prefixIcon:
          widget.prefixIcon != null ? Icon(widget.prefixIcon) : SizedBox(),
      suffixIcon: widget.showCancel != null && !hideCancel
          ? IconButton(
              icon: Icon(Icons.cancel, size: defaultSize * 2),
              onPressed: () {
                _controller.clear();
                setState(() {
                  hideCancel = true;
                });
              },
            )
          : SizedBox(),
      prefixIconColor: kBlack50,
      suffixIconColor: kBlack50,
      hintText: widget.hintText,
      fillColor: kBlack.withOpacity(.05),
      filled: true,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(widget.borderRadius),
      ),
    );
  }

  void hideOrRevealCancel(String value) {
    if (_controller.text.length != 0) {
      setState(() {
        hideCancel = false;
      });
    } else {
      setState(() {
        hideCancel = true;
      });
    }
  }
}
