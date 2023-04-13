import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Filters.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Filter Header and 🔻
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TextLarge(
              title: "Filter",
              color: kBlack70,
              weight: FontWeight.w500,
            ),
            AnimatedRotation(
              turns: 1,
              duration: Duration(milliseconds: 1000),
              child: Icon(Icons.arrow_left, color: kBlack70),
              // child: Icon(Icons.arrow_drop_down_sharp, color: kBlack70),
            ),
          ],
        ),

        // Month, Year
        SizedBox(height: defaultSize),
        Row(
          children: <Widget>[
            Expanded(
              child: buildAppsDropdownButton(
                  list: monthsFilter, selected: currentMonth),
            ),
            SizedBox(width: defaultSize * 2),
            Expanded(
                child: buildAppsDropdownButton(
                    list: yearsFilter, selected: yearsFilter.last))
          ],
        ),

        // Class
        SizedBox(height: defaultSize),
        buildAppsDropdownButton(list: coursesFilter),

        // Section
        SizedBox(height: defaultSize),
        buildAppsDropdownButton(list: sectionFilters),

        // Button
        SizedBox(height: defaultSize),
        buildFilterButton(),
      ],
    );
  }
}
