import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';

class ClassBody extends StatelessWidget {
  const ClassBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Class and List of CARDS
        SizedBox(height: defaultSize * 3),
        // AttendanceList(data: attendanceList),
      ],
    );
  }
}
