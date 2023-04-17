import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Filters.dart';
import 'package:neocloud_mobile/screens/academic/components/filter_section.dart';
import 'package:neocloud_mobile/size_config.dart';

class SessionManagerBody extends StatefulWidget {
  const SessionManagerBody({Key? key}) : super(key: key);

  @override
  State<SessionManagerBody> createState() => _SessionManagerBodyState();
}

class _SessionManagerBodyState extends State<SessionManagerBody> {
  Map<String, String> _filter = {};
  var sessionValue = sessionFilters.last;

  @override
  Widget build(BuildContext context) {
    print("filter: ${_filter}");

    return Column(
      children: <Widget>[
        SizedBox(height: defaultSize * 4),
        // Active Session
        Container(
          width: SizeConfig.screenWidth,
          height: defaultSize * 20,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                kBlue,
                kBlueLight
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(defaultSize * 2),
          ),
          child: Center(
            child: TextCustom(title: sessionValue, fontSize: defaultSize * 8, color: kWhite, weight: FontWeight.w600,),
          ),
        ),

        // Update Session Filter
        SizedBox(height: defaultSize * 3),
        FilterSection(
          press: updateFilter,
          showSession: true,
          label: "Update Session",
          buttonText: "Update",
        )
      ],
    );
  }

  void updateFilter(Map<String, String> filterData) {
    setState(() {
      _filter = filterData;
      sessionValue = filterData["session"]!;
    });
  }
}
