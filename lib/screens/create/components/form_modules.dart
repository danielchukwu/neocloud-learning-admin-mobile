import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_inputfield_and_addbutton.dart';
import 'package:neocloud_mobile/screens/create/components/form_module_tile.dart';
import 'package:neocloud_mobile/screens/create/controllers/create_class_controller.dart';
import 'package:neocloud_mobile/utils/utils.dart';

import 'form_schedule_date_time_generator.dart';

/// This widget displays the modules (or curriculum) of a class, it is also used
/// to further add more modules,add schedules for those modules and delete modules
class FormModules extends StatefulWidget {
  const FormModules({
    super.key,
    this.modules,
    this.enableAutomateDateTime = true,
    this.enableAddModules = true,
    this.enableUpdateModule = true,
  });

  final List<ClassModuleModel>? modules;
  final bool enableAutomateDateTime;
  final bool enableAddModules;
  final bool enableUpdateModule;

  @override
  State<FormModules> createState() => _FormModulesState();
}

class _FormModulesState extends State<FormModules> {
  var c = Get.put(ClassGetXController());
  late List<ClassModuleModel> _modules;

  @override
  void initState() {
    {
      super.initState();
      _modules = c.modules.value;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header - Icon and Title
          _buildHeader(),

          // Column - List of class modules (curriculum)
          if (widget.modules == null)
            Obx(
              () => Column(
                children: List.generate(
                  c.modules.length,
                  (index) => FormModuleTile(
                    module: c.modules[index],
                    index: index,
                  ),
                ),
              ),
            )
          else
            Column(
              children: List.generate(
                widget.modules!.length,
                (index) => FormModuleTile(
                  module: widget.modules![index],
                  index: index,
                ),
              ),
            ),

          // Input - Module InputField and Add Button
          if (widget.enableAddModules)
            FormInputFieldAndAddButton(press: addModule),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Class Modules
        IconText(
          title: 'Modules',
          fontWeight: FontWeight.w500,
          icon: Icons.schema_outlined,
          // icon: Icons.subject_sharp,
          iconColor: Theme.of(context).canvasColor.withOpacity(.6),
          iconSize: 18,
          spaceBetweenSize: 10,
        ),

        // Generate Date and Time
        if (widget.enableAutomateDateTime)
          InkWell(
            onTap: () {
              showDialogWrapper(
                widget: FormScheduleTimeGenerator(
                  modules: c.modules,
                  press: updateModules,
                ),
              );
            },
            child: IconText(
              title: 'Automate DT',
              icon: Icons.rocket,
              iconColor: kBlueLight,
              fontWeight: FontWeight.w500,
              color: kBlueLight,
            ),
          )
      ],
    );
  }

  void addModule(String value) {
    // Add module and then scroll to the bottom
    if (value.isNotEmpty) {
      var newModule = ClassModuleModel(
        id: '${c.modules.length + 1}',
        title: value,
        classSchedules: [],
      );
      setState(() => c.addModule(newModule));
      scrollToBottom(scrollController: c.scrollController.value);
    }
  }

  updateModules(modules) {
    setState(() => c.setModules(modules));
  }
}
