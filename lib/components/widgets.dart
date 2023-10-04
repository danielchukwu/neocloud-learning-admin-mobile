import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';

Widget appsCircularProgressIndicator(BuildContext context) {
  return SizedBox(
    width: defaultSize * 2,
    height: defaultSize * 2,
    child:
        CircularProgressIndicator(strokeWidth: 3, color: Theme.of(context).canvasColor.withOpacity(.4)),
  );
}

Widget spinnerScreen({required BuildContext context, double? screenMaxHeight}){
  screenMaxHeight ??= SizeConfig.screenHeight! / 2;
  
  return Container(
    // color: Colors.red,
    constraints: BoxConstraints(maxHeight: screenMaxHeight),
    child: Center(child: appsCircularProgressIndicator(context)),
  );
}

Widget nothingWasFoundScreen({required BuildContext context, double? screenMaxHeight}){
  screenMaxHeight ??= SizeConfig.screenHeight! / 2;
  
  return Container(
    constraints: BoxConstraints(maxHeight: screenMaxHeight),
    child: Center(child: TextExtraLarge(title: 'Nothing was found', color: Theme.of(context).canvasColor.withOpacity(.4), weight: FontWeight.w600,)),
  );
}

// This is basically a horizontal rule or line that is gray in color
class HorizontalRule extends StatelessWidget {
  const HorizontalRule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color ruleColor = Theme.of(context).canvasColor.withOpacity(.2);

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: ruleColor, width: 1)),
      ),
    );
  }
}

// This is used for custom input fields in forms to display a simple text color in 
// red to indicate an error (that may occur if a value for that field wasn't provided)
class TextInputError extends StatelessWidget {
  const TextInputError({
    super.key,
    this.text = 'This field is required'
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: defaultSize),
        Text(text, style: TextStyle(color: Colors.red[800], fontSize: 12),),
      ],
    );
  }
}