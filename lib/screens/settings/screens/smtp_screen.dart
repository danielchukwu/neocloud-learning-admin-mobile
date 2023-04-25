import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class SmtpScreen extends StatelessWidget {
  SmtpScreen({Key? key}) : super(key: key);
  static String screenName = 'Smtp';
  final String subText =
      'Note that whatever you change here affects the overall application (Web & Mobile)';
  final List<String> inputFieldsList = [
    "Mail Sender",
    "Protocol",
    "Host",
    "Port",
    "Username",
    "Password"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        showAction: false,
        // elevation: .5,
      ),
      body: SingleChildScrollView(
        padding: screenPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            SizedBox(height: defaultSize * 3),
            TextExtraLarge(
                title: 'SMTP Settings',
                color: kBlack90,
                weight: FontWeight.w500),
            SizedBox(height: defaultSize),
            TextMedium(title: subText, color: kBlack60),
            // Form
            Form(
              child: Column(
                children: <Widget>[
                  // Input Fields
                  Column(
                    children: List.generate(
                      inputFieldsList.length,
                          (index) => Padding(
                        padding: EdgeInsets.only(top: defaultSize * 2.5),
                        child: TextFormField(
                          obscureText: false,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText: inputFieldsList[index],
                          ),
                          style: TextStyle(),
                          validator: (value) {},
                          onSaved: (value) {},
                        ),
                      ),
                    ),
                  ),
                  
                  // Submit Form
                  SizedBox(height: defaultSize * 5),
                  AppsButton(title: 'Save', press: (context) => {}, padTopBottom: defaultSize * .5, borderRadius: defaultSize * .5,)
                ],
              ),
            ),

            SizedBox(height: defaultSize * 4),
          ],
        ),
      ),
    );
  }
}
