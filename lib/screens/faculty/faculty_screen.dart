// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/screens/faculty/components/faculty_dashboard.dart';

// @RoutePage()
class FacultyScreen extends StatefulWidget {
  const FacultyScreen({super.key, required this.faculty});
  static String screenName = 'faculty';

  final FacultyModel faculty;

  @override
  State<FacultyScreen> createState() => _FacultyScreenState();
}

class _FacultyScreenState extends State<FacultyScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map> tabletData = [
      {'value': 'widget.faculty.title', 'color': kOrange},
      {'value': 'widget.faculty.hod.fullName', 'color': kGreen},
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
              // SizedBox(height: 20),
              const FacultyDashboard(),
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
  final FacultyModel faculty;

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
          const SizedBox(height: 20),
          TextCustom(
            title: faculty.name ?? '',
            color: kWhite,
            fontSize: 40,
            weight: FontWeight.w600,
          ),

          // HOD
          const SizedBox(height: 10),
          TextSmall(
            title: 'HOD',
            color: kWhite,
            weight: FontWeight.w400,
          ),

          const SizedBox(height: 5),
          buildAvatarAndName(
            avatar: faculty.hod!.avatar ?? '',
            name: faculty.hod!.name ?? '',
            fontSize: 16,
            color: kWhite,
            weight: FontWeight.w500,
            imgBorderSize: .2,
          ),

          // About
          const SizedBox(height: 20),
          TextSeeMore(
            text: faculty.about ?? '',
            color: kWhite,
            maxLines: 6,
            seeMoreColor: kWhite,
          ),

          // Body
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
