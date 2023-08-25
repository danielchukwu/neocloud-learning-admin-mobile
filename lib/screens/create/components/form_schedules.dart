import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/screens/create/components/form_inputfield_and_addbutton.dart';
import 'package:neocloud_mobile/screens/create/components/form_schedule_tile.dart';
import 'package:neocloud_mobile/utils/utils.dart';

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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(defaultSize * 2)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row - Title and Cancel Icon
              FormHeader(),
        
              const HorizontalRule(),
        
              buildModuleCountAndTitle(),
              
              SizedBox(height: defaultSize * 2),
              const HorizontalRule(),
        
              buildBody(),

              const HorizontalRule(),

              FormFooter(title: 'Done', press: () => Navigator.pop(context))
              
            ],
          ),
        ),
      ),
    );
  }

  Expanded buildBody() {
    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollController,
        padding: EdgeInsets.only(left: defaultSize * 2, right: defaultSize * 2, bottom: defaultSize * 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Schedule Header - Icon and Schedule Title
            SizedBox(height: defaultSize * 2),
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
            FormInputFieldAndAddButton(press: createSchedule, count: _schedules.length + 1),

          ],
        ),
      )
            );
  }

  createSchedule(String title) {
    scrollToBottom(scrollController: _scrollController);
    
    var newSchedule = ClassScheduleModel(id: '${_schedules.length + 1}', title: title);
    setState(() => _schedules.add(newSchedule) );
    widget.updateModule(widget.module, widget.module);
  }
  
  updateSchedule(ClassScheduleModel oldSchedule, ClassScheduleModel newSchedule) {
    for (var i = 0; i < widget.module.classSchedules!.length; i++) {
      if (_schedules[i].id == oldSchedule.id) {
        setState(() => _schedules[i] = newSchedule );
      }
    }
  }

  deleteSchedule(schedule) {
    for (var i = 0; i < _schedules.length; i++) {
      if (_schedules[i].id == schedule.id) {
        setState(() => _schedules.removeAt(i));
        // update Module so it reflects current schedules state in the CreateClassScreen 
        // or whatever screen uses this class that has a module
        widget.updateModule(widget.module, widget.module);
      }
    }
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
          TextSmall(title: 'Module ${widget.moduleCount}', weight: FontWeight.w600, color: Colors.black54,),
          
          // Module Title
          SizedBox(height: defaultSize * .5),
          TextLarge(title: 'Module ${_module.title}', weight: FontWeight.w600, color: kBlack80),
        ],
      ),
    );
  }
}


