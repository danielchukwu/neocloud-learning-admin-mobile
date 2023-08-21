import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/utils/validation.dart';

// TextFormField

// Login
class LoginInputField extends StatefulWidget {
  final bool obsureText;
  final String labelText;
  final String? Function(String? value) press;
  final String? Function(String? value) validate;

  LoginInputField({
    Key? key,
    required this.labelText,
    required this.press,
    this.obsureText = false,
    this.validate = validateRequireField,
  }) : super(key: key);

  @override
  State<LoginInputField> createState() => _LoginInputFieldState();
}

class _LoginInputFieldState extends State<LoginInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(defaultSize)),
      ),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.vertical(top: Radius.circular(defaultSize)),
        child: TextFormField(
          keyboardType: getKeyboardType(widget.labelText),
          obscureText: widget.obsureText,
          decoration: buildInputDecoration(),
          style: buildInputTextStyle(),
          validator: widget.validate,
          onSaved: widget.press,
        ),
      ),
    );
  }

  // Style - our form fields input decoration
  InputDecoration buildInputDecoration() {
    return InputDecoration(
      labelText: widget.labelText,
      labelStyle: getAppsTextStyle(color: kBlack50),
      filled: true,
      fillColor: kBlack.withOpacity(.05),
      border: InputBorder.none,
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
  
  TextInputType getKeyboardType(String labelText) {
    switch (labelText.toLowerCase()) {
      case "email":
        return TextInputType.emailAddress;
      case "phone number":
        return TextInputType.phone;
      default:
        return TextInputType.text;
    }
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
    this.onChangePress,
  }) : super(key: key);

  final IconData? prefixIcon;
  final bool showCancel;
  final String hintText;
  final double borderRadius;
  final Function(String value) onSubmitPress;
  final Function(String value)? onChangePress;

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
      onChanged: (String value) { 
        hideOrRevealCancel();
        if (widget.onChangePress != null){
          widget.onChangePress!(_controller.text);
        }
      },
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

  void hideOrRevealCancel() {
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


class FormInputField extends StatelessWidget {
  const FormInputField({
    super.key,
    this.hintText = 'Enter Something',
    this.fontSize = 16, 
    this.fontWeight = FontWeight.w400,
    required this.validator,
    required this.press,
  });

  final String hintText;
  final double fontSize;
  final FontWeight fontWeight;
  final String? Function(String? value) validator;
  final Function(String? value) press;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: getAppsTextStyle(fontSize: fontSize, color: Colors.black87, fontWeight: fontWeight),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.zero,
        hintStyle: getAppsTextStyle(fontSize: fontSize, color: Colors.black38),
        border: const OutlineInputBorder(borderSide: BorderSide.none)
      ),
      validator: validator,
      onSaved: press,
    );
  }
}

class FormTextarea extends StatelessWidget {
  const FormTextarea({
    super.key,
    this.hintText = 'Textarea', 
    this.maxLines = 10,
    required this.validator,
    required this.press,
  });

  final String hintText;
  final int maxLines;
  final String? Function(String? value) validator;
  final Function(String? value) press;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: maxLines,
      style: getAppsTextStyle(color: Colors.black87),
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.symmetric(vertical: defaultSize * 1.5),
        hintStyle: getAppsTextStyle(color: kBlack70),
        border: const OutlineInputBorder(borderSide: BorderSide.none)
      ),
      validator: validator,
      onSaved: press,
    );
  }
}