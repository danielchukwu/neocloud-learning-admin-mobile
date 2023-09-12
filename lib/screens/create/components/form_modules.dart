import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/create/components/form_inputfield_and_addbutton.dart';
import 'package:neocloud_mobile/screens/create/components/form_module_tile.dart';
import 'package:neocloud_mobile/screens/create/controllers/create_class_controller.dart';
import 'package:neocloud_mobile/utils/utils.dart';

/// This widget displays the modules (or curriculum) of a class, it is also used
/// to further add more modules,add schedules for those modules and delete modules
class FormModules extends StatelessWidget {
  FormModules({super.key});
  var c = Get.put(ClassGetXController());

  void addModule(String value) {
    // Add module and then scroll to the bottom
    c.addModule(value);
    scrollToBottom(scrollController: c.scrollController.value);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header - Icon and Title
          buildHeader(),

          // Column - List of class modules (curriculum)
          Obx(() => Column(
              children: List.generate(
                c.modules.length,
                (index) => FormModuleTile(
                  module: c.modules[index],
                  index: index,
                ),
              ),
            ),
          ),

          // Input - Module InputField and Add Button
          FormInputFieldAndAddButton(press: addModule),
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Class Modules
        IconText(
          title: 'Modules',
          color: Colors.black54,
          fontWeight: FontWeight.w500,
          icon: Icons.schema_outlined,
          iconColor: kBlack60,
          iconSize: 18,
          spaceBetweenSize: 10,
        ),

        // Generate Date and Time
        TextLink(
          title: 'Generate DT',
          weight: FontWeight.w500,
          color: kBlueLight,
          press: (_) {
            showScheduleTimeGenerator(
              modules: c.modules,
              press: (modules) {
                print(modules);
                c.modules = modules.obs;
              },
            );
          },
        )
      ],
    );
  }
}
