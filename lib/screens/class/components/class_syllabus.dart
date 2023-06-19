import 'package:flutter/material.dart';
// import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
// import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/class/components/class_modules_list.dart';
// import 'package:neocloud_mobile/screens/course/components/modules_list.dart';

class ClassSyllabus extends StatefulWidget {
  const ClassSyllabus({super.key, required this.modules});

  final List<ClassModule> modules;

  @override
  State<ClassSyllabus> createState() => _ClassSyllabusState();
}

class _ClassSyllabusState extends State<ClassSyllabus> {
  bool showContent = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Course Outline Header
        buildHeaderDropdown(),

        // Modules count, lectures count, Time involved count
        SizedBox(height: defaultSize * 1.5),
        buildModulesLecturesTimeCount(),

        // Modules and Their contents
        SizedBox(height: defaultSize),
        showContent
            ? ClassModulesList(
                modules: modulesList,
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildHeaderDropdown() {
    return HeaderWithDropdown(
      title: "Syllabus",
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
            title: 'Weeks (45)',
            icon: Icons.dataset,
            iconColor: kBlack70,
            fontSize: defaultSize * 1.4),
        IconText(
            title: 'Meetups (68)',
            icon: Icons.messenger_outlined,
            iconColor: kBlack70,
            fontSize: defaultSize * 1.4),
        IconText(
            title: 'CWs (14)',
            icon: Icons.work_history_rounded,
            iconColor: kBlack70,
            fontSize: defaultSize * 1.4)
      ],
    );
  }
}
