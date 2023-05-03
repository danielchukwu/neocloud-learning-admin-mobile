import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';
import 'package:neocloud_mobile/screens/course/components/module_item.dart';

class ModulesList extends StatefulWidget {
  const ModulesList({
    super.key,
    required this.modules,
  });
  final List<CourseModule> modules;

  @override
  State<ModulesList> createState() => _ModulesListState();
}

class _ModulesListState extends State<ModulesList> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(
            widget.modules.length > 3 && !showMore ? 3 : widget.modules.length,
            (index) => ModuleItem(
              module: widget.modules[index],
              index: index,
            ),
          ).toList() +
          <Widget>[
            SizedBox(
              height: defaultSize * 1,
            ),
            TextLink(
              title: !showMore ? "See more" : "See less",
              color: kBlue,
              fontSize: defaultSize * 1.6,
              weight: FontWeight.w600,
              press: (_) => setState(() => showMore = !showMore),
            ),
          ],
    );
  }
}


