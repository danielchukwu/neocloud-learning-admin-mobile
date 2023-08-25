import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/validation.dart';

/// This widget displays an input field that enables a user to update ... It is special because when it's tapped on it displays an input
class FormUpdateOrDeleteInputField extends StatefulWidget {
  const FormUpdateOrDeleteInputField({
    super.key,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.hintText,
    this.initialValue,
    this.autoFocus = true,
    required this.pressUpdate,
    this.pressDelete,
  });

  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? hintText;
  final String? initialValue;
  final bool autoFocus;
  final Function(String) pressUpdate;
  // if this is null, the delete icon 🗑️ won't show up
  final Function()? pressDelete;

  @override
  State<FormUpdateOrDeleteInputField> createState() => _FormUpdateOrDeleteInputFieldState();
}

class _FormUpdateOrDeleteInputFieldState extends State<FormUpdateOrDeleteInputField> {
  bool deleteWasClicked = false;
  

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.text = widget.initialValue ?? '';

    return  Row(
      children: [
        // Textarea - Edit Title
        Expanded(
          child: Container(
            // color: kRed,
            height: defaultSize * 2.4,
            child: Stack(
              children: [
                Positioned(
                  height: defaultSize * 5,
                  width: SizeConfig.screenWidth! / 1.4,
                  top: -10,
                  child: Container(
                    // color: kGreen,
                    child: FormTextarea(
                      fontSize: widget.fontSize ?? 14,
                      fontWeight: widget.fontWeight ?? FontWeight.w400,
                      textColor: widget.textColor ?? Colors.black87,
                      hintText: widget.hintText ?? '',
                      initialValue: widget.initialValue,
                      controller: controller,
                      maxLines: 1,
                      validator: validateRequireField, 
                      press: (_) {}, 
                      autoFocus: widget.autoFocus,
                      pressOnKeyboardDone: () => widget.pressUpdate(controller.text),
                      onTapOutside: (_) {
                        // // We delay the call of this just incase the user tapped on the delete icon, 
                        // // this wouldn't prevent the delete action
                        Future.delayed(const Duration(seconds: 2), deleteWasClicked == false ? widget.pressUpdate(controller.text) : () { debugPrint('FormUpdateDeleteInputField: 🗑️🗑️🗑️'); });
                      },
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),

        // Icon
        widget.pressDelete != null 
        ? GestureDetector(
            onTap: () { 
              print('FormUpdateDeleteInputField: DELETING 0');
              setState(() { deleteWasClicked = true; });
              widget.pressDelete!();
            },
            child: Icon(Icons.delete_outline, color: kRed.withOpacity(.9), size: defaultSize * 2)
          )
        : SizedBox(),
      ],
    );
    ;
  }
}