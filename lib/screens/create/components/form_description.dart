import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/utils/validation.dart';

class FormDescription extends StatelessWidget {
  const FormDescription({
    super.key,
    this.maxLine,
    this.controller,
    required this.press
  });

  final Function(String? value) press;
  final int? maxLine;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: Icon(Icons.short_text, color: Theme.of(context).canvasColor.withOpacity(.5),),
        ),
      
         // TextArea
        const SizedBox(width: 10),
        Expanded(
          child: FormTextarea(
            controller: controller,
            maxLines: maxLine ?? 10,
            hintText: 'Add Description',
            validator: validateRequireField,
            press: press,
          ),
        ),
      ]
    );
  }
}
