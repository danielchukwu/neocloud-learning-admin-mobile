import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Class.dart';
import 'package:neocloud_mobile/models/Courses.dart';

class ClassModuleCardsContainer extends StatefulWidget {
  const ClassModuleCardsContainer({
    super.key,
    required this.module,
    required this.index,
  });
  final int index;
  final ClassModule module;

  @override
  State<ClassModuleCardsContainer> createState() =>
      _ClassModuleCardsContainerState();
}

class _ClassModuleCardsContainerState extends State<ClassModuleCardsContainer> {
  bool showContent = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: defaultSize),
        // e.g Module 1 - Introduction to Networking
        HeaderWithDropdown(
          title: "Module ${widget.index + 1} - ${widget.module.title}",
          color: kBlack70,
          fontSize: defaultSize * 1.6,
          icon: Icons.add,
          press: () => setState(() => showContent = !showContent),
          showContent: showContent,
        ),

        // list of cards
        SizedBox(height: defaultSize * .5),
        showContent
            ? Column(
                children: List<Widget>.generate(
                  widget.module.materials!.length,
                  (index) => buildClassModuleCard(
                    index: index,
                    clas: widget.module.materials![index],
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget buildClassModuleCard(
      {required ClassModuleItem clas, required int index}) {
    return Padding(
      padding: EdgeInsets.only(top: defaultSize),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Count
          Container(
            alignment: Alignment.topRight,
            width: defaultSize * 2,
            child: TextMedium(
              title: '${index + 1}',
            ),
          ),

          // Course title, type - duration
          SizedBox(
            width: defaultSize,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title
                TextMedium(
                  title: clas.title,
                  weight: FontWeight.w500,
                  color: kBlack90,
                ),

                // Type - Duration
                SizedBox(height: defaultSize * .5),
                TextSmall(
                  title: clas.description,
                  color: kBlack70,
                ),

                // Duration
                SizedBox(height: defaultSize * .5),
                Row(
                  children: [
                    // Class Duration
                    IconText(
                      title: clas.duration,
                      icon: Icons.watch_later_rounded,
                      fontSize: defaultSize * 1.4,
                      iconSize: defaultSize * 1.6,
                      iconColor: kBlack70,
                    ),

                    // Classworks
                    SizedBox(width: defaultSize * 2),
                    IconText(
                      title: '2 Classworks',
                      icon: Icons.table_chart_rounded,
                      fontSize: defaultSize * 1.4,
                      iconSize: defaultSize * 1.6,
                      iconColor: kBlack70,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Play btn (if made previewable for sampling)
          Padding(
            padding: const EdgeInsets.only(top: 1),
            child: TextSmall(
              title: clas.date,
              color: kBlack50,
            ),
          )
        ],
      ),
    );
  }
}
