import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Faculty.dart';

class FacultyScreen extends StatefulWidget {
  const FacultyScreen({super.key, required this.faculty});
  static String screenName = 'Faculty';

  final Faculty faculty;

  @override
  State<FacultyScreen> createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map> tabletData = [
      {'value': widget.faculty.title, 'color': kOrange},
      {'value': widget.faculty.hod.fullName, 'color': kGreen},
    ];

    return Scaffold(
      body: CustomScrollView(slivers: <Widget>[
        buildSliverAppBar(
          title: FacultyScreen.screenName,
          bgColor: kWhite,
          isDark: true,
          showLeading: true,
          showAction1: false,
        ),
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Faculty Screen - Go Off

              pageBottomPadding()
            ],
          ),
        ),
      ]),
    );
  }
}
