import 'package:flutter/material.dart';

import '../../../components/texts.dart';
import '../../../constraints.dart';

/// This widget basically displays a button that when clicke should submit a form or carry out any action we want
/// It takes a formKey and uses it to  check if the data in the form the formKey is attached to are all valid, 
/// if they are it runs a function press( This should submit the form or perform some action)  
class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key, 
    this.title = 'Create',
    required this.formKey,
    required this.press,
  });
  final String title;
  final GlobalKey<FormState>? formKey;
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
              try {
                if (formKey!.currentState!.validate()) {
                  formKey!.currentState!.save();
                  // submit form (or do something)
                  press();
                }
              } catch (e) {
                Navigator.pop(context);
              }
            },
            child: TextSmall(title: title, weight: FontWeight.w600, color: Colors.black54,),
          )
        ],
      ),
    );
  }
}