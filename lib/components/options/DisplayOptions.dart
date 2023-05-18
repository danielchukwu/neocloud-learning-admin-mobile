import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/constraints.dart';
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
          padding: EdgeInsets.symmetric(vertical: defaultSize * .5, horizontal: defaultSize * 2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              buildOptionButton(index * 2),
              SizedBox(width: defaultSize * 2),
              buildOptionButton((index * 2) + 1),
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildOptionButton(int index) {
    return Expanded(
      child: OptionButton(
        title: items[index].title,
        press: () => press(index),
        bgColor:
            (index) == getSelectedIndex() ? kBlueLight : kBlack.withOpacity(.05),
      ),
    );
  }
}
