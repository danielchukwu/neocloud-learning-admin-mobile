// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
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
        AppsSliverAppBar(
          title: FacultyScreen.screenName,
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
        child: Icon(
          Icons.add,
          color: getColorOpposite(Theme.of(context).canvasColor),
        ),
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
            title: faculty.name,
            color: getColorOpposite(Theme.of(context).canvasColor),
            fontSize: 40,
            weight: FontWeight.w600,
          ),

          // HOD
          const SizedBox(height: 10),
          TextSmall(
            title: 'HOD',
            color: getColorOpposite(Theme.of(context).canvasColor),
            weight: FontWeight.w400,
          ),

          const SizedBox(height: 5),
          CircularAvartarAndName(
            avatar: faculty.hod!.avatar,
            name: faculty.hod!.name,
            fontSize: 16,
            color: getColorOpposite(Theme.of(context).canvasColor),
            weight: FontWeight.w500,
            imgBorderSize: .2,
          ),

          // About
          const SizedBox(height: 20),
          TextSeeMore(
            text: faculty.about ?? '',
            color: getColorOpposite(Theme.of(context).canvasColor),
            maxLines: 6,
            seeMoreColor: getColorOpposite(Theme.of(context).canvasColor),
          ),

          // Body
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
