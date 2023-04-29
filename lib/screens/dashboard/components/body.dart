import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/dashboard/components/profile_section.dart';
import 'package:neocloud_mobile/screens/dashboard/components/title_count_section.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // _controller.jumpTo(100.0);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _controller,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Section 1 - Attendance, Events
          SizedBox(height: defaultSize * 2),
          buildSectionOne(),

          // Section 2 - Students, Educators, Admin, Grant Permission
          SizedBox(height: defaultSize * 3),
          buildSectionTwo(context)
        ],
      ),
    );
  }

  Container buildSectionOne() {
    return Container(
      padding: screenPadding,
      child: Column(
        children: [
          TitleCountSection(
            title: 'Todays Attendance',
            count: '0',
            press: (context) => navigateToComingSoon(context: context),
          ),
          SizedBox(height: defaultSize * 1),
          TitleCountSection(
            title: 'Recent Events',
            count: '0',
            press: (context) => navigateToComingSoon(context: context),
          ),
        ],
      ),
    );
  }

  Container buildSectionTwo(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.fromLTRB(
          defaultSize * 2, 0, defaultSize * 2, defaultSize * 12),
      // Background
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(defaultSize * 3),
        ),
      ),

      // List the users
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Students Section
          ListProfileSection(title: 'Students', data: users),

          // Educators Section
          ListProfileSection(title: 'Educators', data: users),

          // Admin Section
          ListProfileSection(title: 'Admin', data: users),

          // Grant Permission
          SizedBox(height: defaultSize * 3),
          TextCustom(
            title: "Grant Permission",
            fontSize: defaultSize * 2.2,
            color: kBlack80,
            weight: FontWeight.w600,
          ),
          SizedBox(height: defaultSize * 2),

          // Thumbs up and Text
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(width: defaultSize * 2),
              Image(
                  image: AssetImage('assets/icons/thumbs-up.png'),
                  width: defaultSize * 5,
              ),
              SizedBox(width: defaultSize * 2),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextMedium(
                      title:
                          'Grant Permission for Students or Educators to be able to take certain courses at NCT',
                      color: kBlack60,
                    ),
                    SizedBox(height: defaultSize * 2),
                    AppsButton(
                      title: 'Grant',
                      press: (context) =>
                          navigateToComingSoon(context: context),
                      bgColor: kBlue,
                      padTopBottom: defaultSize * .5,
                      borderRadius: defaultSize * 4,
                    ),
                  ],
                ),
              ),
              SizedBox(width: defaultSize * 2),
            ],
          ),
          SizedBox(height: defaultSize * 2),
        ],
      ),
    );
  }
}
