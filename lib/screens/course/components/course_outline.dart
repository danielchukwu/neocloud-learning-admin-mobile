import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/components/modules_list.dart';

class CourseOutline extends StatefulWidget {
  const CourseOutline({super.key, required this.modules});

  final List<CourseModule> modules;

  @override
  State<CourseOutline> createState() => _CourseOutlineState();
}

class _CourseOutlineState extends State<CourseOutline> {
  bool showContent = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Course Outline Header
        buildHeaderDropdown(),

        // Modules count, lectures count, Time involved count
        SizedBox(height: 10),
        buildModulesLecturesTimeCount(),

        // Modules and Their contents
        SizedBox(height: 20),
        showContent
            ? ModulesList(
                modules: modulesList,
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildHeaderDropdown() {
    return HeaderWithDropdown(
      title: "Course Outline",
      weight: FontWeight.w600,
      press: () => setState(() => showContent = !showContent),
      showContent: showContent,
    );
  }

  Widget buildModulesLecturesTimeCount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // Items
        IconText(
            title: 'Modules (45)',
            icon: Icons.featured_play_list_sharp,
            iconColor: Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: 14),
        IconText(
            title: 'Lectures (158)',
            icon: Icons.video_library,
            iconColor: Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: 14),
        IconText(
            title: 'Time (115hrs)',
            icon: Icons.watch_later,
            iconColor: Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: 14)
      ],
    );
  }
}
