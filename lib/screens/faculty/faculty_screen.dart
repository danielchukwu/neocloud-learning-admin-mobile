import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/screens/faculty/components/faculty_dashboard.dart';

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
              // Title, Hod, Description
              FacultyBlueCardSection(faculty: widget.faculty),

              // Faculty Dashboard
              // SizedBox(height: defaultSize * 2),
              FacultyDashboard(),
            ],
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: kBlue,
        child: Icon(Icons.add, color: kWhite),
      ),
    );
  }
}

class FacultyBlueCardSection extends StatelessWidget {
  const FacultyBlueCardSection({
    super.key,
    required this.faculty,
  });
  final Faculty faculty;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: screenPadding,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [kBlue, kBlue.withOpacity(.7)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          SizedBox(height: defaultSize * 2),
          TextCustom(
            title: faculty.title,
            color: kWhite,
            fontSize: defaultSize * 4,
            weight: FontWeight.w600,
          ),

          // HOD
          SizedBox(height: defaultSize),
          // TextSmall(
          //   title: 'HOD',
          //   color: kWhite,
          //   weight: FontWeight.w400,
          // ),

          SizedBox(height: defaultSize * .5),
          buildAvatarAndName(
            avatar: faculty.hod.avatar,
            name: faculty.hod.fullName,
            fontSize: defaultSize * 1.6,
            color: kWhite,
            weight: FontWeight.w500,
            imgBorderSize: .2,
          ),

          // About
          SizedBox(height: defaultSize * 2),
          TextSeeMore(
            text: faculty.about,
            color: kWhite,
            maxLines: 6,
            seeMoreColor: kWhite,
          ),

          // Body
          SizedBox(
            height: defaultSize * 4,
          ),
        ],
      ),
    );
  }
}
