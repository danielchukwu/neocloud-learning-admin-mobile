import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/headers/headear_dropdown.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import '../../../graphql/models/ClassModuleModel.dart';
import '../../../graphql/models/ClassScheduleModel.dart';

class ClassModuleCardsContainer extends StatefulWidget {
  const ClassModuleCardsContainer({
    super.key,
    required this.module,
    required this.index,
  });
  final int index;
  final ClassModuleModel module;

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
        const SizedBox(height: 10),
        // e.g Module 1 - Introduction to Networking
        HeaderWithDropdown(
          title: "Module ${widget.index + 1} - ${widget.module.title}",
          color: Theme.of(context).canvasColor.withOpacity(.7),
          fontSize: 16,
          icon: Icons.add,
          press: () => setState(() => showContent = !showContent),
          showContent: showContent,
        ),

        // list of cards
        const SizedBox(height: 5),
        showContent
            ? Column(
                children: List<Widget>.generate(
                  widget.module.classSchedules!.length,
                  (index) => buildClassModuleCard(
                    index: index,
                    clas: widget.module.classSchedules![index],
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }

  Widget buildClassModuleCard(
      {required ClassScheduleModel clas, required int index}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Count
          Container(
            alignment: Alignment.topRight,
            width: 20,
            child: TextMedium(
              title: '${index + 1}',
            ),
          ),

          // Course title, type - duration
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title
                TextMedium(
                  title: clas.title,
                  weight: FontWeight.w500,
                  color: Theme.of(context).canvasColor.withOpacity(.9),
                ),

                // Type - Duration
                const SizedBox(height: 5),
                TextSmall(
                  title: clas.description ?? 'This is a description',
                  color: Theme.of(context).canvasColor.withOpacity(.7),
                ),

                // Duration
                const SizedBox(height: 5),
                Row(
                  children: [
                    // Class Duration
                    IconText(
                      title: '${clas.startTime} - ${clas.endTime}',
                      icon: Icons.watch_later_rounded,
                      fontSize: 14,
                      iconSize: 16,
                      iconColor: Theme.of(context).canvasColor.withOpacity(.7),
                    ),

                    // Classworks
                    const SizedBox(width: 20),
                    IconText(
                      title: '2 Classworks',
                      icon: Icons.table_chart_rounded,
                      fontSize: 14,
                      iconSize: 16,
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
              title: 'Mon',
              color: Theme.of(context).canvasColor.withOpacity(.5),
            ),
          )
        ],
      ),
    );
  }
}
