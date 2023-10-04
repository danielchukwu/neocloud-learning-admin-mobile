import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';


class SelectPillsWithLimit extends StatefulWidget {
  const SelectPillsWithLimit({
    super.key,
    required this.items,
    this.selectionBgColor,
    this.textColor,
    this.selectionLimit = 50,
    required this.pressAdd,
  }) : assert(selectionLimit > 0);

  final List<String> items;
  final Color? selectionBgColor;
  final Color? textColor;
  final int selectionLimit;
  final Function(List<int> index) pressAdd;

  @override
  State<SelectPillsWithLimit> createState() => _SelectPillsWithLimitState();
}

class _SelectPillsWithLimitState extends State<SelectPillsWithLimit> {
  List<int> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List.generate(
        widget.items.length,
        (index) => TextPill(
          index: index,
          text: widget.items[index],
          bgColor: _selectedItems.contains(index) ? Theme.of(context).canvasColor.withOpacity(.8) : getColorOpposite(Theme.of(context).canvasColor),
          textColor: _selectedItems.contains(index) ? getColorOpposite(Theme.of(context).canvasColor) : Theme.of(context).canvasColor.withOpacity(.8),
          press: (index) {
            if (_selectedItems.contains(index)){
              setState(() => _selectedItems.remove(index!));
              widget.pressAdd([0]);
            } else {
              if (_selectedItems.length < widget.selectionLimit) {
                setState(() => _selectedItems.add(index!) );
                widget.pressAdd(_selectedItems);
              } else {
                setState(() => _selectedItems.last = index! );
                widget.pressAdd(_selectedItems);
              }
            }
          },
        ),
      ),
    );
  }
}


class SelectPillsWrap extends StatelessWidget {
  const SelectPillsWrap({
    super.key,
    required this.items,
    this.selectionBgColor,
    this.textColor,
    required this.pressAdd,
    required this.pressRemove,
  });

  final List<String> items;
  final Color? selectionBgColor;
  final Color? textColor;
  final Function(int index) pressAdd;
  final Function(int index) pressRemove;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      children: List.generate(
        items.length,
        (index) => SelectionPill(
          text: items[index],
          selectionBgColor: selectionBgColor ?? kBlueLight,
          textColor: textColor ?? getColorOpposite(Theme.of(context).canvasColor),
          index: index,
          pressAdd: pressAdd,
          pressRemove: pressRemove,
        ),
        ),
      );
  }
}


class TextPill extends StatelessWidget {
  TextPill({
    super.key,
    required this.text,
    this.index,
    this.press,
    this.bgColor = Colors.blue,
    this.textColor,
  });

  final int? index;
  final String text;
  final Color bgColor;
  late Color ? textColor;
  final Function(int? index)? press;

  @override
  Widget build(BuildContext context) {
    textColor ??= getColorOpposite(Theme.of(context).canvasColor);
    return InkWell(
      onTap: () {
        if (press != null) {
          press!(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        constraints: const BoxConstraints(minWidth: 50),
        decoration: buildDecoration(context),
        child: TextMedium(
          title: text,
          color: textColor,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  BoxDecoration buildDecoration(BuildContext context) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: Theme.of(context).canvasColor.withOpacity(.3), width: 1),
    );
  }
}


class SelectionPill extends StatefulWidget {
  const SelectionPill({
    super.key,
    required this.index,
    required this.text,
    this.selectionBgColor,
    this.textColor,
    this.isSelected,
    required this.pressAdd,
    required this.pressRemove,
  });
  final int index;
  final String text;
  final Color? selectionBgColor;
  final Color? textColor;
  final bool? isSelected;
  final Function(int index) pressAdd;
  final Function(int index) pressRemove;

  @override
  State<SelectionPill> createState() => _SelectionPillState();
}

class _SelectionPillState extends State<SelectionPill> {
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
    isSelected = widget.isSelected ?? isSelected;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isSelected) {
          setState(() => isSelected = false);
          widget.pressRemove(widget.index);
        } else {
          setState(() => isSelected = true);
          widget.pressAdd(widget.index);
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
        constraints: const BoxConstraints(minWidth: 50),
        decoration: buildDecoration(),
        child: TextMedium(
          title: widget.text,
          color: isSelected 
            ? widget.textColor ?? getColorOpposite(Theme.of(context).canvasColor) 
            : Theme.of(context).canvasColor.withOpacity(.8),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  BoxDecoration buildDecoration() {
    return BoxDecoration(
      color: isSelected
          ? widget.selectionBgColor ?? kBlueLight
          : getColorOpposite(Theme.of(context).canvasColor),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      border: Border.all(color: Theme.of(context).canvasColor.withOpacity(.3), width: 1),
    );
  }
}
