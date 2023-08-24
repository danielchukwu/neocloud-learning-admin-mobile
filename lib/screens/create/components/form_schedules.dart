import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/screens/create/components/form_schedule_tile.dart';

/// POPUP
/// This screen is used in a showDialog dialog context, so it basically will be shown in a pop up context 
/// in the CreateClassScreen() for adding schedules to schedules that are created for a class
class FormSchedules extends StatefulWidget {
  const FormSchedules({super.key, required this.module, required this.moduleCount, required this.updateModule});

  final ClassModuleModel module;
  final int moduleCount;
  final Function(ClassModuleModel module, ClassModuleModel newModule ) updateModule;

  @override
  State<FormSchedules> createState() => _FormSchedulesState();
}

class _FormSchedulesState extends State<FormSchedules> {
  final _scrollController = ScrollController();
  late ClassModuleModel _module;
  late List<ClassScheduleModel> _schedules;

  @override
  void initState() {
    super.initState();
    _module = widget.module;
    _schedules = widget.module.classSchedules!;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: defaultSize , vertical: defaultSize * 3),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(defaultSize * 2)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row - Title and Cancel Icon
            FormHeader(),

            const HorizontalRule(),

            buildModuleCountAndTitle(),
            
            SizedBox(height: defaultSize * 2),
            const HorizontalRule(),

            SizedBox(height: defaultSize * 2),
            
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                padding: screenPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Schedule Header - Icon and Schedule Title
                    buildScheduleListHeader(),

                     // Column - List of class schedules (curriculum)
                    Column(
                      children: List.generate(
                        _schedules.length,
                        (index) => FormScheduleTile(
                          schedule: _schedules[index], 
                          count: index + 1, 
                          pressUpdateSchedule: updateSchedule, 
                          pressDeleteSchedule: deleteSchedule,
                        )
                      ),
                    ),

                    // Input - Module TextArea and Add Button
                    // FormModuleInputField(press: addModule, count: _schedules.length + 1),

                  ],
                ),
              )
            )
            
          ],

        ),
      ),
    );
  }

  Widget buildScheduleListHeader() {
    return IconText(
      title: 'Schedules',
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      icon: Icons.view_agenda_outlined,
      iconColor: kBlack60,
      iconSize: defaultSize * 1.8,
      spaceBetweenSize: defaultSize * 1,
    );
  }
  
  Widget buildModuleCountAndTitle() {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Module Count
          SizedBox(height: defaultSize * 2),
          TextMedium(title: 'Module ${widget.moduleCount}', weight: FontWeight.w600, color: Colors.black54,),
          
          // Module Title
          SizedBox(height: defaultSize),
          TextMedium(title: 'Module ${_module.title}', weight: FontWeight.w600, color: kBlack80),
        ],
      ),
    );
  }

  updateSchedule(ClassScheduleModel oldSchedule, ClassScheduleModel newSchedule) {
    for (var i = 0; i < _schedules.length; i++) {
      if (_schedules[i].id == oldSchedule.id) {
        setState(() { _schedules[i] = newSchedule; });
        widget.updateModule(widget.module, ClassModuleModel.fromInstance(module: widget.module));
      }
    }
  }

  deleteSchedule(schedule) {
    setState(() => _schedules.remove(schedule) );
    widget.updateModule(widget.module, ClassModuleModel.fromInstance(module: widget.module));
  }
}


