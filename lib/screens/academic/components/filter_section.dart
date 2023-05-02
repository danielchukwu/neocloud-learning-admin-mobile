import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Filters.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({
    Key? key,
    required this.press,
    this.showMonthYear = false,
    this.showRange = false,
    this.showStatus = false,
    this.showClass = false,
    this.showSection = false,
    this.showSession = false,
    this.label = "Filter",
    this.buttonText = "Filter",
  }) : super(key: key);

  final Function(Map<String, String> filterData) press;
  final bool showMonthYear;
  final bool showRange;
  final bool showStatus;
  final bool showClass;
  final bool showSection;
  final bool showSession;
  final String label;
  final String buttonText;

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  Map<String, String> filter = {};
  double turns = 0;
  bool showContent = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Filter Header and 🔻
        HeaderWithDropdown(
          title: 'Filter',
          showContent: showContent,
          press: () => setState(() {
            showContent = !showContent;
          }),
        ),

        showContent
            ? Column(
                children: <Widget>[
                  // Month, Year
                  widget.showMonthYear
                      ? SizedBox(height: defaultSize)
                      : SizedBox(),
                  widget.showMonthYear ? buildMonthYearField() : SizedBox(),

                  // range
                  widget.showRange ? SizedBox(height: defaultSize) : SizedBox(),
                  widget.showRange
                      ? buildAppsDropdownButton(
                          list: dateRangeFilters,
                          press: updateFilter(k: "range"),
                        )
                      : SizedBox(),

                  // Status
                  widget.showStatus
                      ? SizedBox(height: defaultSize)
                      : SizedBox(),
                  widget.showStatus
                      ? buildAppsDropdownButton(
                          list: statusFilters,
                          press: updateFilter(k: "status"),
                        )
                      : SizedBox(),

                  // Class
                  widget.showClass ? SizedBox(height: defaultSize) : SizedBox(),
                  widget.showClass
                      ? buildAppsDropdownButton(
                          list: coursesFilter,
                          press: updateFilter(k: "class"),
                        )
                      : SizedBox(),

                  // Section
                  widget.showSection
                      ? SizedBox(height: defaultSize)
                      : SizedBox(),
                  widget.showSection
                      ? buildAppsDropdownButton(
                          list: sectionFilters,
                          press: updateFilter(k: "section"),
                        )
                      : SizedBox(),

                  // Session
                  widget.showSession
                      ? SizedBox(height: defaultSize)
                      : SizedBox(),
                  widget.showSession
                      ? buildAppsDropdownButton(
                          list: sessionFilters,
                          press: updateFilter(k: "session"),
                          selected: sessionFilters.last,
                        )
                      : SizedBox(),

                  // Button
                  SizedBox(height: defaultSize),
                  buildFilterButton(
                    press: (context) {
                      widget.press(filter);
                    },
                    buttonText: widget.buttonText,
                  ),
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
}