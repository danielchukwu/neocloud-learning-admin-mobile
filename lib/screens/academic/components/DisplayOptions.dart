import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/models/Options.dart';

class DisplayOptions extends StatelessWidget {
  const DisplayOptions({
    Key? key,
    required this.items,
    required this.getSelectedIndex,
    required this.press,
  }) : super(key: key);

  // Contains a list of Options Object (to be displayed)
  final List<Option> items;
  // Gets the selectedIndex
  final Function() getSelectedIndex;
  // This changes the selectedIndex when pressed
  final Function(int index) press;

  @override
  Widget build(BuildContext context) {
    // The length of the items to be displayed divided by 2 should balance out
    // in our row which should have 2 option buttons for each row
    int rowCount = (items.length / 2).toInt();
    return Column(
      children: List.generate(
        rowCount,
        (index) => Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildOptionButton(context, index * 2),
              const SizedBox(width: 20),
              _buildOptionButton(context, (index * 2) + 1),
            ],
          ),
        ),
      ),
    );
  }

  Expanded _buildOptionButton(BuildContext context, int index) {
    return Expanded(
      child: AppsButton(
        title: items[index].title,
        borderRadius: buttonBorderRadius,
        minButtonHeight: 38,
        fontSize: 17,
        bgColor: (index) == getSelectedIndex()
            ? kBlueLight
            : Theme.of(context).canvasColor.withOpacity(.05),
        color: (index) == getSelectedIndex()
            ? getColorOpposite(Theme.of(context).canvasColor)
            : Theme.of(context).canvasColor.withOpacity(.7),
        press: (context) => press(index),
        padTopBottom: .5,
        weight:
            index == getSelectedIndex() ? FontWeight.w600 : FontWeight.w400,
      ),
    );
  }
}
