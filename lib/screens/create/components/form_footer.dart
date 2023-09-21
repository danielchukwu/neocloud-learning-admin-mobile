import 'package:flutter/material.dart';

import '../../../components/texts.dart';
import '../../../constraints.dart';

/// This widget basically displays a button that when clicke should submit a form or carry out any action we want
/// It takes a formKey and uses it to  check if the data in the form the formKey is attached to are all valid, 
/// if they are it runs a function press( This should submit the form or perform some action)  
class FormFooter extends StatelessWidget {
  const FormFooter({
    super.key, 
    String title = 'Create',
    bool btnIsLoading = false,
    GlobalKey<FormState>? formKey,
    required dynamic Function() press, 
  }) : _press = press, _formKey = formKey, _title = title, _btnIsLoading = btnIsLoading;

  final String _title;
  final GlobalKey<FormState>? _formKey;
  final Function() _press;
  final bool _btnIsLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // SizedBox(),
          TextButton(
            style: ButtonStyle(
              shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7), // Adjust the radius as needed
                ),
              ),
              fixedSize: const MaterialStatePropertyAll(Size(100, 40)),
              backgroundColor: MaterialStatePropertyAll(_btnIsLoading ? Colors.blue[100] : kBlue),
              // padding: MaterialStatePropertyAll<EdgeInsets>(EdgeInsets.symmetric(horizontal: 20)),
            ),
            onPressed: _btnIsLoading ? null : () {
              try {
                if (_formKey!.currentState!.validate()) {
                  _formKey!.currentState!.save();
                  // submit form (or do something)
                  _press();
                }
              } catch (e) {
                Navigator.pop(context);
              }
            },
            child: _btnIsLoading == false 
              ? TextSmall(title: _title, weight: FontWeight.w600, color: Colors.white,) 
              : buildCirularProgressIndicator(),
          )
        ],
      ),
    );
  }

  SizedBox buildCirularProgressIndicator() {
    return SizedBox(
            width: 10,
            height: 10,
            child: CircularProgressIndicator(color: Colors.grey[800], strokeWidth: 2),
          );
  }
}