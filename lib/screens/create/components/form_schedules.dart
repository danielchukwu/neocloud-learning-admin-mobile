import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/components/widgets.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_footer.dart';
import 'package:neocloud_mobile/screens/create/components/form_header.dart';
import 'package:neocloud_mobile/screens/create/components/form_inputfield_and_addbutton.dart';
import 'package:neocloud_mobile/screens/create/components/form_schedule_tile.dart';
import 'package:neocloud_mobile/screens/create/components/from_index_title_header.dart';
import 'package:neocloud_mobile/utils/utils.dart';



/// POPUP
/// This screen is used in a showDialog dialog context, so it basically will be shown in a pop up context 
/// in the CreateClassScreen() for adding schedules to schedules that are created for a class
class FormSchedules extends StatefulWidget {
  const FormSchedules({
    super.key, 
    required this.index, 
    required this.module, 
    required this.updateModule, 
  });

  final int index;
  final ClassModuleModel module;
  final Function(int moduleIndex, ClassModuleModel newModule) updateModule;

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
      margin: EdgeInsets.symmetric(horizontal: defaultSize , vertical: 30),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row - Title and Cancel Icon
              const FormHeader(),
        
              const HorizontalRule(),
        
              FormIndexTextAndTitleHeader(indexText: 'Module ${widget.index + 1}', title: _module.title),
              
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
        padding: const EdgeInsets.only(left: 20, right: 20, bottom: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Schedule Header - Icon and Schedule Title
            const SizedBox(height: 20),
            buildScheduleListHeader(),

              // Column - List of class schedules (curriculum)
            Column(
              children: List.generate(
                _schedules.length,
                (index) => FormScheduleTile(
                  schedule: _schedules[index], 
                  index: index, 
                  pressUpdateSchedule: updateSchedule, 
                  pressDeleteSchedule: deleteSchedule,
                )
              ),
            ),

            // Input - Module TextArea and Add Button
            FormInputFieldAndAddButton(press: createSchedule),

          ],
        ),
      )
            );
  }

  createSchedule(String title) {
    scrollToBottom(scrollController: _scrollController);
    
    var newSchedule = ClassScheduleModel(id: '${_schedules.length + 1}', title: title);
    setState(() => _schedules.add(newSchedule));
    widget.updateModule(widget.index, widget.module);
  }
  
  updateSchedule(int index, ClassScheduleModel newSchedule) {
    setState(() => _schedules[index] = newSchedule );
  }

  deleteSchedule(int index) {
    print(index);
    setState(() => _schedules.removeAt(index));
    // widget.updateModule(widget.index, widget.module);
  }

  Widget buildScheduleListHeader() {
    return IconText(
      title: 'Schedules',
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      icon: Icons.view_agenda_outlined,
      iconColor: kBlack60,
      iconSize: 18,
      spaceBetweenSize: 10,
    );
  }
}
