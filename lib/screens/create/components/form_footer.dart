import 'package:flutter/material.dart';

import '../../../components/texts.dart';
import '../../../constraints.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key, 
    required this.formKey,
    required this.press,
  });
  final GlobalKey<FormState> formKey;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(defaultSize * .7), // Adjust the radius as needed
                ),
              ),
              backgroundColor: const MaterialStatePropertyAll(Colors.black12),
              padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: defaultSize * 2)),
            ),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                press();
              }
            },
            child: const TextSmall(title: 'Create', weight: FontWeight.w600, color: Colors.black54,),
          )
        ],
      ),
    );
  }
}