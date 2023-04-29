import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/constraints.dart';

class SettingsForm extends StatefulWidget {
  const SettingsForm({
    super.key,
    required this.inputFieldsList,
    required this.data,
  });

  // This list should contain the names of all the input fields to beaa
  // created
  final List<String> inputFieldsList;

  // This will be used to store the form data entered by the user
  // It usually expects an empty Map = {}
  final Map<String, String> data;

  @override
  State<SettingsForm> createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();

  Future<void> submitForm({required Map<String, String> data}) async {
    // Make API POST request to authenticate student user
    print("----Submit Form----");
    print(data);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          // Input Fields
          Column(
            children: List.generate(
              widget.inputFieldsList.length,
                  (index) => Padding(
                padding: EdgeInsets.only(top: defaultSize * 2.5),
                child: InputFieldSettings(
                    fieldName: widget.inputFieldsList[index],
                    press: (String key, String value) {
                      setState(() {
                        widget.data[key] = value;
                      });
                    }
                ),
              ),
            ),
          ),

          // Submit Form
          SizedBox(height: defaultSize * 3.5),
          AppsButton(
            title: 'Save',
            press: (context) {
              if (_formKey.currentState!.validate()) {
                // Save form
                _formKey.currentState!.save();
                // Submit form data
                submitForm(data: widget.data);
              }
            },
            padTopBottom: defaultSize * .7,
            borderRadius: defaultSize * .7,
          )
        ],
      ),
    );
  }
}