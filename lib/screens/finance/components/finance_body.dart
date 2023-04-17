import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/finance_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';

class FinanceBody extends StatefulWidget {
  const FinanceBody({Key? key}) : super(key: key);

  @override
  State<FinanceBody> createState() => _FinanceBodyState();
}

class _FinanceBodyState extends State<FinanceBody> {
  late TextEditingController _searchController;
  late Map<String, String> _filter = {};

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: "");

    _searchController.addListener(() {
      // Filter and fetch data if necessary
      print(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('finance filter: $_filter');
    return SingleChildScrollView(
      child: Container(
        padding: screenPadding,
        child: Column(
          children: [
            // Search Text Field
            buildSearchTextField(press: updateSearchController),

            // Filter
            SizedBox(height: defaultSize * 3),
            FilterSection(press: updateFilter, showRange: true, showClass: true, showSection: true,),

            // 📄 Export and + Add Button
            SizedBox(height: defaultSize * 3),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
              Expanded(
                child: AppsButton(
                  title: "Export Report",
                  press: (context) {},
                  icon: Icons.file_copy,
                  bgColor: kBlueLight,
                  padTopBottom: defaultSize * 0.3,
                  borderRadius: buttonBorderRadius,
                ),
              ),
                SizedBox(width: defaultSize),
                Expanded(child: buildAddButton(title: "Add Invoice", press: (context) {})),
              ],
            ),

            // ClassWork List
            SizedBox(height: defaultSize * 2),
            Column(
              children: List.generate(financeList.length, (index) => FinanceCard(data: financeList[index])),
            ),

            // Bottom Padding
            pageBottomPadding(),
          ],
        ),
      ),
    );
  }
  
  void updateSearchController(String value) {
    setState(() {
      _searchController.text = value;
    });
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      _filter = filterData;
    });
  }
}
