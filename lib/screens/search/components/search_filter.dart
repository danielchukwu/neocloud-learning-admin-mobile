import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({
    super.key,
    required this.updateIndex,
    required this.selectedIndex,
    required this.searchFilter,
  });

  final int selectedIndex;
  final Function(int index) updateIndex;
  final List<String> searchFilter;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List<Widget>.generate(
              searchFilter.length,
              (index) => GestureDetector(
                onTap: () => updateIndex(index),
                child: Container(
                  color: Colors.transparent,
                  margin: const EdgeInsets.only(top: 10),
                  padding: index == 0
                      ? const EdgeInsets.fromLTRB(
                          40,
                          10,
                          18,
                          10,
                        )
                      : const EdgeInsets.symmetric(
                          horizontal: 18,
                          vertical: 10,
                        ),
                  child: TextMedium(
                    title: searchFilter[index],
                    color: selectedIndex == index ? kBlack90 : kBlack50,
                    weight: selectedIndex == index
                        ? FontWeight.w600
                        : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ),
        Divider(color: kBlack.withOpacity(.3)),
      ],
    );
  }
}
