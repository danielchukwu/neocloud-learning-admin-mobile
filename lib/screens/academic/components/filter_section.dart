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
                      ? const SizedBox(height: 10)
                      : const SizedBox(),
                  widget.showMonthYear ? buildMonthYearField() : const SizedBox(),

                  // range
                  widget.showRange ? const SizedBox(height: 10) : const SizedBox(),
                  widget.showRange
                      ? buildAppsDropdownButton(
                          list: dateRangeFilters,
                          press: updateFilter(k: "range"),
                        )
                      : const SizedBox(),

                  // Status
                  widget.showStatus
                      ? const SizedBox(height: 10)
                      : const SizedBox(),
                  widget.showStatus
                      ? buildAppsDropdownButton(
                          list: statusFilters,
                          press: updateFilter(k: "status"),
                        )
                      : const SizedBox(),

                  // Class
                  widget.showClass ? const SizedBox(height: 10) : const SizedBox(),
                  widget.showClass
                      ? buildAppsDropdownButton(
                          list: coursesFilter,
                          press: updateFilter(k: "class"),
                        )
                      : const SizedBox(),

                  // Section
                  widget.showSection
                      ? const SizedBox(height: 10)
                      : const SizedBox(),
                  widget.showSection
                      ? buildAppsDropdownButton(
                          list: sectionFilters,
                          press: updateFilter(k: "section"),
                        )
                      : const SizedBox(),

                  // Session
                  widget.showSession
                      ? const SizedBox(height: 10)
                      : const SizedBox(),
                  widget.showSession
                      ? buildAppsDropdownButton(
                          list: sessionFilters,
                          press: updateFilter(k: "session"),
                          selected: sessionFilters.last,
                        )
                      : const SizedBox(),

                  // Button
                  const SizedBox(height: 10),
                  buildFilterButton(
                    press: (context) {
                      widget.press(filter);
                    },
                    buttonText: widget.buttonText,
                  ),
                ],
              )
            : const SizedBox(),
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
        const SizedBox(width: 20),
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