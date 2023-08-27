import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_update_or_delete_inputfield.dart';

// This is a form class module tile widget that shows a modules title and it's order count
// and then it shows the number of schedules the module has and also an add schedules button
class FormModuleTile extends StatefulWidget {
  const FormModuleTile({
    super.key,
    required this.module,
    required this.index,
    required this.pressUpdateModule,
    required this.pressDeleteModule,
  });

  final ClassModuleModel module;
  final int index;
  final Function(int moduleIndex, ClassModuleModel newModule) pressUpdateModule;
  final Function(int index)pressDeleteModule;

  @override
  State<FormModuleTile> createState() => _FormModuleTileState();
}

class _FormModuleTileState extends State<FormModuleTile> {
  late ClassModuleModel _module;
  bool _editMode = false;

  @override
  void initState() {
    super.initState();
    _module = widget.module;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultSize * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Module Index
          SizedBox(width: defaultSize),
          SizedBox(
            width: defaultSize * 3, 
            child: _editMode == false
            ? TextMedium(title: '${widget.index + 1}', color: Colors.black54)
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
      onTap: () => setState(() { _editMode = true; }),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          _editMode == false 
          ? TextMedium(  title: _module.title, color: kBlack80, weight: FontWeight.w500)
          : FormUpdateOrDeleteInputField(fontSize: defaultSize * 1.6, textColor: kBlack80, fontWeight: FontWeight.w500, hintText: 'Schedule Title', initialValue: _module.title, pressUpdate: updateModule, pressDelete: () => widget.pressDeleteModule(widget.index)),
    
          // row - schedules count, view schedules
          SizedBox(height: defaultSize * .8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // schedules count
              TextSmall(
                title: '${_module.classSchedules?.length ?? 0} Schedules',
                color: Colors.black54,
              ),
    
              // view schedules
              GestureDetector(
                onTap: () => showCreateScheduleDialog(module: _module, moduleCount: widget.index, updateModule: widget.pressUpdateModule),
                child: const TextSmall(
                  title: 'View Schedules',
                  color: Colors.black54,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  updateModule(String title) {
    setState(() => _editMode = false );
    if (_module.title != title) {
      setState(() { _module = ClassModuleModel(id: _module.id, title: title); });
    }
  }
}
