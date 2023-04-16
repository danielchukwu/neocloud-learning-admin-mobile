import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/list/faculty_list.dart';

class FacultyBody extends StatelessWidget {
  const FacultyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Faculty and List of CARDS
        SizedBox(height: defaultSize * 3),
        FacultyList(data: facultiesList),
      ],
    );
  }
}
