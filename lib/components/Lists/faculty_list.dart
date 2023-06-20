import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/components/cards/faculty_card.dart';
// import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Faculty.dart';

class FacultyList extends StatelessWidget {
  const FacultyList({Key? key, required this.facultyList}) : super(key: key);

  final List<Faculty> facultyList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(facultiesList.length,
          (index) => FacultyCard(faculty: facultiesList[index])),
    );
  }
}
