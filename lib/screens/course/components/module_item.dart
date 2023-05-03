import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Courses.dart';

class ModuleItem extends StatefulWidget {
  const ModuleItem({
    super.key,
    required this.module,
    required this.index,
  });
  final int index;
  final CourseModule module;

  @override
  State<ModuleItem> createState() => _ModuleItemState();
}

class _ModuleItemState extends State<ModuleItem> {
  bool showContent = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: defaultSize),
        HeaderWithDropdown(
          title: "Module ${widget.index + 1} - ${widget.module.title}",
          color: kBlack50,
          fontSize: defaultSize * 1.6,
          icon: Icons.add,
          press: () => setState(() => showContent = !showContent),
          showContent: showContent,
        ),

        // Videos of a particular module
        SizedBox(height: defaultSize * .5),
        showContent
            ? Column(
                children: List<Widget>.generate(
                  widget.module.materials!.length,
                  (index) => buildModuleItem(
                    index: index,
                    material: widget.module.materials![index],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  ListTile buildModuleItem(
      {required CourseMaterial material, required int index}) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      horizontalTitleGap: 0,

      // Count
      leading: Container(
        padding: EdgeInsets.only(top: defaultSize * .5),
        alignment: Alignment.topRight,
        width: defaultSize * 2,
        child: TextMedium(
          title: '${index + 1}',
        ),
      ),

      // Course title, type - duration
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Title
          TextMedium(
            title: material.title,
            weight: FontWeight.w500,
            color: kBlack,
          ),

          // Type - Duration
          SizedBox(height: defaultSize * .5),
          TextSmall(
            title: "${material.type} - ${material.duration} mins",
            color: kBlack70,
          )
        ],
      ),

      // Play btn (if made previewable for sampling)
      trailing: Container(
        padding: EdgeInsets.only(top: defaultSize * .5),
        alignment: Alignment.topRight,
        // color: Colors.blue,
        width: defaultSize * 4,
        child: Icon(
          Icons.play_arrow,
          color: kBlue,
        ),
      ),
    );
  }
}
