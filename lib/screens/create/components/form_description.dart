import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/validation.dart';

class FormDescription extends StatelessWidget {
  const FormDescription({
    super.key,
    required this.press
  });

  final Function(String? value) press;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Icon
        Padding(
          padding: EdgeInsets.only(top: defaultSize * 1.3),
          child: Icon(Icons.short_text, color: Colors.black54),
        ),
      
         // TextArea
        SizedBox(width: defaultSize),
        Container(
          width: SizeConfig.screenWidth! / 1.3,
          child: FormTextarea(
            hintText: 'Add Description',
            validator: validateRequireField,
            press: press,
          )
        ),
      ]
    );
  }
}
