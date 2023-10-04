import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/graphql/services/class_service.dart';
import 'package:neocloud_mobile/models/Students.dart';
import 'package:neocloud_mobile/screens/Profile/components/profile_dashboard.dart';
import 'package:neocloud_mobile/utils/utils.dart';

import '../../../components/widgets.dart';

class ProfileContent extends StatelessWidget {
  const ProfileContent({Key? key, required this.type}) : super(key: key);

  final String type;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "dashboard":
        return const ProfileDashboard();
      case "info":
        return const ProfileAbout();
      case "classes":
        return const ProfileClasses();
      default:
        return const SizedBox();
    }
  }
}

// Get classes specific to this user
class ProfileClasses extends StatefulWidget {
  const ProfileClasses({
    super.key,
  });

  @override
  State<ProfileClasses> createState() => _ProfileClassesState();
}

class _ProfileClassesState extends State<ProfileClasses> {
  var classService = ClassService();
  List<ClassEntity>? classList;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    classService.getClasses().then((classes) {
      setState(() {
        classList = classes;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return classList == null
        ? spinnerScreen(context: context)
        : classList!.isEmpty
            ? nothingWasFoundScreen(context: context)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  classList!.length,
                  (index) => ClassCard(clas: classList![index]),
                ),
    );
    // return SizedBox();
  }
}

class ProfileAbout extends StatelessWidget {
  const ProfileAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var user = users[9];

    return Container(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // About Section
          const SizedBox(height: 15),
          TextLarge(title: 'ABOUT', weight: FontWeight.w500, color: Theme.of(context).canvasColor.withOpacity(.8)),
          // Body
          const SizedBox(height: 10),
          TextMedium(
            title: user.about,
            color: Theme.of(context).canvasColor.withOpacity(.8),
          ),

          // Roles Section
          const SizedBox(height: 30),
          TextLarge(title: 'ROLES', weight: FontWeight.w500, color: Theme.of(context).canvasColor.withOpacity(.8)),

          // Icons List
          const SizedBox(height: 10),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              user.role.length,
              (index) => IconText(
                title: user.role[index],
                svg: getRoleSvgFileName(role: user.role[index]),
                iconIsLeft: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
