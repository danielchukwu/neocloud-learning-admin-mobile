import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Filters.dart';

class AcademicFilterSection extends StatefulWidget {
  const AcademicFilterSection({Key? key}) : super(key: key);

  @override
  State<AcademicFilterSection> createState() => _AcademicFilterSectionState();
}

class _AcademicFilterSectionState extends State<AcademicFilterSection> {
  double turns = 0;
  bool displayFilter = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Filter Header and 🔻
        GestureDetector(
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
        ),

        displayFilter
        ? Column(
          children: <Widget>[
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
        ) : SizedBox(),
      ],
    );
  }
}
