import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Faculty.dart';

class FacultyBody extends StatelessWidget {
  const FacultyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Cards
        SizedBox(height: defaultSize),
        Column(
          children: List.generate(facultiesList.length, (index) => FacultyCard(faculty: facultiesList[index])),
        ),
      ],
    );
  }
}
