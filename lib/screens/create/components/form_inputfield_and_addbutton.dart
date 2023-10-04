import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/utils/validation.dart';

/// This widget contains a Module Count Text, a Textarea and an add button that when pressed
/// calls a function that should supposedly save or store the value of the Textarea as a Module
class FormInputFieldAndAddButton extends StatefulWidget {
  const FormInputFieldAndAddButton({
    super.key,
    this.hintText = 'Title',
    this.buttonText = 'Add Item',
    required this.press,
  });

  final String buttonText;
  final String hintText;
  final Function(String value) press;

  @override
  State<FormInputFieldAndAddButton> createState() =>
      _FormInputFieldAndAddButtonState();
}

class _FormInputFieldAndAddButtonState
    extends State<FormInputFieldAndAddButton> {
  final _modulesTitleController = TextEditingController();
  bool showModuleInputField = false;

  @override
  void dispose() {
    _modulesTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Input - Count, TextArea
        showModuleInputField ? buildBody() : const SizedBox(),

        // Button - Add Module
        buildSubmitButton(),
      ],
    );
  }

  Widget buildSubmitButton() {
    return Padding(
      padding: EdgeInsets.only(left: 40, top: showModuleInputField ? 0 : 20),
      child: GestureDetector(
        onTap: addModule,
        child: Text(
          widget.buttonText,
          style: TextStyle(
            color: Theme.of(context).canvasColor.withOpacity(.7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void addModule() {
    if (showModuleInputField == false) {
      setState(() => showModuleInputField = true);
    } else {
      widget.press(_modulesTitleController.text);
      setState(() => _modulesTitleController.text = '');
    }
  }

  Widget buildBody() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Count
        const SizedBox(width: 10),
        SizedBox(
          width: 30,
          child: Padding(
            padding: EdgeInsets.only(top: 14),
            child: TextMedium(title: '--', color: Theme.of(context).canvasColor.withOpacity(.5)),
          ),
        ),

        // TextArea
        Expanded(
          child: buildTextarea(),
        ),
      ],
    );
  }

  Widget buildTextarea() {
    return TextFormField(
      controller: _modulesTitleController,
      minLines: 1,
      onTapOutside: onTapOutside,
      autofocus: true,
      textInputAction: TextInputAction.done, // Display done in keyboard
      onEditingComplete:
          pressOnKeyboardDone, // execute function when done is clicked on the keyboard
      style: appsTextStyle(
          color: Theme.of(context).canvasColor.withOpacity(.8), fontWeight: FontWeight.w500, fontSize: 16),
      decoration: textAreaDecoration(),
    );
  }

  InputDecoration textAreaDecoration() {
    return InputDecoration(
        hintText: widget.hintText,
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        hintStyle: appsTextStyle(color: Theme.of(context).canvasColor.withOpacity(.5)),
        border: const OutlineInputBorder(borderSide: BorderSide.none));
  }

  void onTapOutside(_) {
    if (_modulesTitleController.text.isEmpty) {
      setState(() {
        showModuleInputField = false;
      });
    }
  }

  void pressOnKeyboardDone() {
    if (_modulesTitleController.text.isNotEmpty) {
      widget.press(_modulesTitleController.text);
      setState(() {
        _modulesTitleController.text = '';
      });
    }
  }
}
