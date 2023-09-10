import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/validation.dart';

/// This widget displays an input field that enables a user to update ... It is special because when it's tapped on it displays an input
class FormUpdateOrDeleteInputField extends StatelessWidget {
  const FormUpdateOrDeleteInputField({
    super.key,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.hintText,
    this.initialValue,
    this.autoFocus = true,
    this.pressDelete,
    required this.pressUpdate, 
    this.press,
  });

  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final String? hintText;
  final String? initialValue;
  final bool autoFocus;
  // final double textareaPosition;
  final Function(String) pressUpdate;
  // if this is null, the delete icon 🗑️ won't show up
  final Function()? pressDelete;
  final Function()? press;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    controller.text = initialValue ?? '';

    return Row(
      children: [
        // Textarea - Edit Title
        Expanded(
          child: SizedBox(
            height: 24,
            child: Stack(
              children: [
                Positioned(
                  height: 48.5,
                  width: SizeConfig.screenWidth! / 1.4,
                  top: -10,
                  child: FormTextarea(
                    fontSize: fontSize ?? 14,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    textColor: textColor ?? Colors.black87,
                    hintText: hintText ?? '',
                    initialValue: initialValue,
                    controller: controller,
                    maxLines: 1,
                    validator: validateRequireField,
                    press: (_) {},
                    autoFocus: autoFocus,
                    pressOnKeyboardDone: () => pressUpdate(controller.text),
                    // onTapOutside: (_) {
                    //   pressUpdate(controller.text);
                    // },
                  ),
                ),
              ],
            ),
          ),
        ),
      
        // Icon
        pressDelete != null
            ? GestureDetector(
                onTap: () {
                  if (press!= null) press!();
                  pressDelete!();
                },
                child: Icon(
                  Icons.delete_outline,
                  color: kRed.withOpacity(.9), 
                  size: 20,
                ))
            : const SizedBox(),
      ],
    );
    ;
  }
}
