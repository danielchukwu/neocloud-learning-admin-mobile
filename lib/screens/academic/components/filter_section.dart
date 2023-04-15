import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Filters.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({
    Key? key,
    required this.press,
  }) : super(key: key);

  final Function(Map<String, String> filterData) press;

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  Map<String, String> filter = {};
  double turns = 0;
  bool displayFilter = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Filter Header and 🔻
        buildFilterHeader(),

        displayFilter
            ? Column(
                children: <Widget>[
                  // Month, Year
                  SizedBox(height: defaultSize),
                  buildMonthYearField(),

                  // Class
                  SizedBox(height: defaultSize),
                  buildAppsDropdownButton(
                    list: coursesFilter,
                    press: updateFilter(k: "class"),
                  ),

                  // Section
                  SizedBox(height: defaultSize),
                  buildAppsDropdownButton(
                    list: sectionFilters,
                    press: updateFilter(k: "section"),
                  ),

                  // Button
                  SizedBox(height: defaultSize),
                  buildFilterButton(press: (context) {
                    widget.press(filter);
                  }),
                ],
              )
            : SizedBox(),
      ],
    );
  }

  Row buildMonthYearField() {
    return Row(
      children: <Widget>[
        Expanded(
          child: buildAppsDropdownButton(
            list: monthsFilter,
            selected: currentMonth,
            press: updateFilter(k: "month"),
          ),
        ),
        SizedBox(width: defaultSize * 2),
        Expanded(
          child: buildAppsDropdownButton(
            list: yearsFilter,
            selected: yearsFilter.last,
            press: updateFilter(k: "year"),
          ),
        )
      ],
    );
  }

  // This function returns a function that's used to update the filter
  // with whatever value was selected using the dropDownButton
  Function(String) updateFilter({required String k}) {
    return (value) {
      setState(() {
        filter[k] = value;
      });
    };
  }

  GestureDetector buildFilterHeader() {
    return GestureDetector(
      onTap: () {
        setState(() {
          turns = turns == -.25 ? 0 : -.25;
          displayFilter = turns == 0 ? false : true;
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          TextLarge(
            title: "Filter",
            color: kBlack70,
            weight: FontWeight.w500,
          ),
          AnimatedRotation(
            turns: turns,
            duration: Duration(milliseconds: 100),
            child: Icon(Icons.arrow_left, color: kBlack70),
            // child: Icon(Icons.arrow_drop_down_sharp, color: kBlack70),
          ),
        ],
      ),
    );
  }
}
