import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/services/class_module_service.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'class_modules_list.dart';

class ClassSyllabus extends StatefulWidget {
  const ClassSyllabus(
      {super.key, required this.modules, required this.classId});

  final List<ClassModule> modules;
  final String classId;

  @override
  State<ClassSyllabus> createState() => _ClassSyllabusState();
}

class _ClassSyllabusState extends State<ClassSyllabus> {
  bool showContent = true;
  var classModuleService = ClassModuleService();
  List<ClassModuleModel>? classModulesList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    classModuleService
        .getClassModules(classId: widget.classId)
        .then((cModules) {
      setState(() {
        classModulesList = cModules;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Course Outline Header
        buildHeaderDropdown(),

        // Modules count, lectures count, Time involved count
        const SizedBox(height: 15),
        buildModulesLecturesTimeCount(),

        // Modules and Their contents
        const SizedBox(height: 10),
        showContent
            ? classModulesList == null
                ? const Center(child: CircularProgressIndicator())
                : classModulesList!.isEmpty
                    ? const Center(child: Text('No Classes Found'))
                    : ClassModulesList(
                        modules: classModulesList!,
                      )
            : const SizedBox(),
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
            title:
                'Weeks (${classModulesList != null ? classModulesList!.length : 0})',
            icon: Icons.dataset,
            iconColor: Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: 14),
        IconText(
            title: 'Meetups (68)',
            icon: Icons.messenger_outlined,
            iconColor: Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: 14),
        IconText(
            title: 'CWs (14)',
            icon: Icons.timer,
            iconColor: Theme.of(context).canvasColor.withOpacity(.7),
            fontSize: 14)
      ],
    );
  }
}
