import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

// TextFormField
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

    _controller.addListener(() {
      // Filter and fetch data if necessary
      print(_controller.text);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      maxLines: 1,
      textInputAction: TextInputAction.search,
      style: getAppsTextStyle(fontWeight: FontWeight.w400, color: kBlack80),
      onSubmitted: widget.onSubmitPress,
      decoration: buildDecoration(),
    );
  }

  InputDecoration buildDecoration() {
    return InputDecoration(
      contentPadding: EdgeInsets.symmetric(vertical: defaultSize),
      prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon) : SizedBox(),
      suffixIcon: widget.showCancel != null ? IconButton(icon: Icon(Icons.cancel_outlined), onPressed: _controller.clear,) : SizedBox(),
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
}
