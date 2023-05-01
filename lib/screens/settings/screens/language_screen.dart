import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Languages.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({ Key? key }) : super(key: key);

  static String screenName = "Language";

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    List<LanguageType> languages = LanguageType.values;
    return Scaffold(
      appBar: buildAppBar(
        title: LanguageScreen.screenName,
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
          children: LanguageType.values.map((language) => ListTile(
            contentPadding: EdgeInsets.zero,
            title: TextLarge(title: language.name, weight: FontWeight.w400),
            trailing: Radio(
              value: language,
              onChanged: (LanguageType? value) {
                setState(() {
                  Language.selected = value!;
                });
              },
              groupValue: Language.selected,
            ),
          )).toList(),
        ),
      ),
    );
  }
}
