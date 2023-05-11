import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/dashboard/components/personel_dashboard.dart';
import 'package:neocloud_mobile/screens/dashboard/components/section_one.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        buildSliverAppBar(
          title: "Dashboard",
          bgColor: kWhite,
          elevation: .1,
          isDark: true,
          showLeading: false,
          showAction1: false,
          showAction2: false,
        ),
        SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section 1 (Intro dashboard)
            AttendanceClassesCwDashboard(),

            // Section 2
            SizedBox(height: defaultSize * 5),
            PersonelDashboard(),

            // buildGrantPermission(),
          ],
        )),
      ],
    );
  }
}

