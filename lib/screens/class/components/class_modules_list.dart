import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/class/components/class_module_cards_container.dart';

import '../../../graphql/models/ClassModuleModel.dart';
// import 'package:neocloud_mobile/models/Courses.dart';
// import 'package:neocloud_mobile/screens/course/components/module_item.dart';

class ClassModulesList extends StatefulWidget {
  const ClassModulesList({
    super.key,
    required this.modules,
  });
  final List<ClassModuleModel> modules;

  @override
  State<ClassModulesList> createState() => _ClassModulesListState();
}

class _ClassModulesListState extends State<ClassModulesList> {
  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List<Widget>.generate(
            widget.modules.length > 3 && !showMore ? 3 : widget.modules.length,
            (index) => ClassModuleCardsContainer(
              module: widget.modules[index],
              index: index,
            ),
          ).toList() +
          <Widget>[
            const SizedBox(
              height: 10,
            ),
            TextLink(
              title: !showMore ? "See more" : "See less",
              color: kBlue,
              fontSize: 16,
              weight: FontWeight.w600,
              press: (_) => setState(() => showMore = !showMore),
            ),
          ],
    );
  }
}
