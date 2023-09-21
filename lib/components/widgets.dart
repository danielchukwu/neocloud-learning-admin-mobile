import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';

Widget appsCircularProgressIndicator() {
  return const SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(strokeWidth: 3, color: Colors.black38),
  );
}

Widget spinnerScreen({double? screenMaxHeight}) {
  screenMaxHeight ??= SizeConfig.screenHeight! / 2;

  return Container(
    // color: Colors.red,
    constraints: BoxConstraints(maxHeight: screenMaxHeight),
    child: Center(child: appsCircularProgressIndicator()),
  );
}

Widget nothingWasFoundScreen({double? screenMaxHeight}) {
  screenMaxHeight ??= SizeConfig.screenHeight! / 2;

  return Container(
    constraints: BoxConstraints(maxHeight: screenMaxHeight),
    child: const Center(
        child: TextExtraLarge(
      title: 'Nothing was found',
      color: Colors.black38,
      weight: FontWeight.w600,
    )),
  );
}

// This is basically a horizontal rule or line that is gray in color
class HorizontalRule extends StatelessWidget {
  const HorizontalRule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color ruleColor = kBlack.withOpacity(.2);

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
  const TextInputError({super.key, this.text = 'This field is required'});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Text(
          text,
          style: TextStyle(color: Colors.red[800], fontSize: 12),
        ),
      ],
    );
  }
}
