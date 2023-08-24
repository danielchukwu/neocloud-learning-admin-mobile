import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/utils/validation.dart';

/// This widget contains a Module Count Text, a Textarea and an add button that when pressed
/// calls a function that should supposedly save or store the value of the Textarea as a Module
class FormModuleInputField extends StatefulWidget {
  const FormModuleInputField({
    super.key,
    required this.count,
    required this.press,
  });

  final int count;
  final Function(String value) press;

  @override
  State<FormModuleInputField> createState() => _FormModuleInputFieldState();
}

class _FormModuleInputFieldState extends State<FormModuleInputField> {
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
      padding: EdgeInsets.only(left: defaultSize * 3.7, top: showModuleInputField ? 0 : defaultSize * 2),
      child: GestureDetector(
        onTap: addModule,
        child: IconText(
          title: 'Add Module',
          icon: Icons.add,
          iconSize: defaultSize * 2.4,
          fontWeight: FontWeight.w500,
          color: kBlack70,
          iconColor: kBlack70,
        ),
      ),
    );
  }

  void addModule() {
    if (showModuleInputField == false) {
      setState(() => showModuleInputField = true );
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
        SizedBox(width: defaultSize),
        SizedBox(
          width: defaultSize * 3,
          child: Padding(
            padding: EdgeInsets.only(top: defaultSize * 1.4),
            child: TextMedium(title: '${widget.count}', color: Colors.black54),
          ),
        ),

        // TextArea
        Expanded(
          child: buildTextarea(),
        ),
      ],
    );
  }

  TextFormField buildTextarea() {
    // final myFocusNode = FocusNode();

    // // scroll to the bottom of the screen when modules 0
    // myFocusNode.addListener(() {
    //   if (myFocusNode.hasFocus) {
    //     // scroll to the bottom
    //     // if (widget.pressScrollToBottom != null) widget.pressScrollToBottom!();
    //   }
    // });

    return TextFormField(
          // focusNode: myFocusNode,
          controller: _modulesTitleController,
          minLines: 1,
          onTapOutside: onTapOutside,
          textInputAction: TextInputAction.done,  // Display done in keyboard
          onEditingComplete: pressOnKeyboardDone,   // execute function when done is clicked on the keyboard
          style: appsTextStyle(color: Colors.black87),
          decoration: textAreaDecoration(),
          validator: validateRequireField,
          onSaved: (newValue) {},
        );
  }

  InputDecoration textAreaDecoration() {
    return InputDecoration(
      hintText: 'Module Title',
      contentPadding: EdgeInsets.symmetric(vertical: defaultSize * 1.5),
      hintStyle: appsTextStyle(color: kBlack70),
      border: const OutlineInputBorder(borderSide: BorderSide.none)
    );
  }

  void onTapOutside(_) {
    if (_modulesTitleController.text.isEmpty) {
      setState(() {
        showModuleInputField = false;
      });
    }
  }

  pressOnKeyboardDone() {
    if (_modulesTitleController.text.isNotEmpty) {
      widget.press(_modulesTitleController.text);
      setState(() {
        _modulesTitleController.text = '';
      });
    }
  }


  /// if the enter key is pressed on the keyboard this function catches it and executes a function to create a module
  // addEnterListenerOnTextarea({required Function press, required Widget widget}) {
  //   return RawKeyboardListener(
  //     focusNode: FocusNode(onKey: (node, event) {
  //       if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
  //         return KeyEventResult.handled; // prevent passing the event into the textfield
  //       }
  //       return KeyEventResult.ignored; // pass the event to the textfield
  //     }),
  //     onKey: (event) {
  //       if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
  //         // create module
  //         press();
  //         setState(() {
  //           _modulesTitleController.text = '';
  //         });
  //       }
  //     },
  //     child: widget
  //   );
  // }
}