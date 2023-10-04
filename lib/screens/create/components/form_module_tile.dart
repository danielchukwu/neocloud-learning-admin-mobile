import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_schedules.dart';
import 'package:neocloud_mobile/screens/create/components/form_update_or_delete_inputfield.dart';
import 'package:neocloud_mobile/screens/create/controllers/create_class_controller.dart';

// This is a form class module tile widget that shows a modules title and it's order count
// and then it shows the number of schedules the module has and also an add schedules button
class FormModuleTile extends StatefulWidget {
  FormModuleTile({
    super.key,
    required this.index,
    required this.module,
    this.enableUpdateModuleTitle = true,
    this.enableUpdateScheduleTitle = true,
    this.enableUpdateScheduleDescription = true,
    this.enableUpdateScheduleClasswork = true,
    this.enableScheduleSetDateAndTime = true,
  });

  final int index;
  ClassModuleModel module;
  final bool enableUpdateModuleTitle;
  final bool enableUpdateScheduleTitle;
  final bool enableUpdateScheduleDescription;
  final bool enableUpdateScheduleClasswork;
  final bool enableScheduleSetDateAndTime;

  @override
  State<FormModuleTile> createState() => _FormModuleTileState();
}

class _FormModuleTileState extends State<FormModuleTile> {
  var c = Get.put(ClassGetXController());
  bool _editMode = false;
  late ClassModuleModel _module;

  @override
  void initState() {
    super.initState();
    _module = widget.module;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Module Index
          const SizedBox(width: 10),
          SizedBox(
            width: 30,
            child: _editMode == false
                ? Text('${widget.index + 1}', style: Theme.of(context).textTheme.bodyMedium)
                : const SizedBox(),
          ),

          // Column - Title, Row (schedules count, add schedules btn)
          Expanded(child: buildBody())
        ],
      ),
    );
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () {
        if (widget.enableUpdateModuleTitle) {
          setState(() => _editMode = true);
        }
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          _editMode == false
              ? Text(widget.module.title, style: Theme.of(context).textTheme.labelMedium)
              : FormUpdateOrDeleteInputField(
                  fontSize: 16,
                  textColor: Theme.of(context).canvasColor.withOpacity(.8),
                  fontWeight: FontWeight.w500,
                  hintText: 'Schedule Title',
                  initialValue: widget.module.title,
                  pressUpdate: updateModule,
                  pressDelete: deleteModule,
                ),

          // row - schedules count, view schedules
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // schedules count
              Text(
                '${widget.module.classSchedules?.length ?? 0} Schedules',
                style: TextStyle(
                  color: Theme.of(context).canvasColor.withOpacity(.5)
                ),
              ),

              // view schedules
              GestureDetector(
                onTap: () {
                  showDialogWrapper(
                    widget: FormSchedules(
                      module: widget.module,
                      index: widget.index,
                      updateModule: c.updateModule,
                      enableScheduleSetDateAndTime: widget.enableScheduleSetDateAndTime,
                      enableUpdateScheduleClasswork: widget.enableUpdateScheduleClasswork,
                      enableUpdateScheduleDescription: widget.enableUpdateScheduleDescription,
                      enableUpdateScheduleTitle: widget.enableUpdateModuleTitle,
                    ),
                  );
                },
                child: Text(
                  'View Schedules',
                  style: TextStyle(
                    color: Theme.of(context).canvasColor.withOpacity(.5)
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  deleteSchedule(int index) {
    setState(() => widget.module.classSchedules!.removeAt(index));
  }

  deleteModule() {
    setState(() => _editMode = false);
    c.deleteModule(widget.index);
  }

  updateModule(String title) {
    setState(() => _editMode = false);
    if (widget.module.title != title) {
      var newModule =
          ClassModuleModel.fromInstance(title: title, module: widget.module);
      c.updateModule(widget.index, newModule);
    }
  }
}
