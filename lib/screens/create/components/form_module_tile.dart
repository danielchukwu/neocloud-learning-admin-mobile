import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/input/input_fields.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/size_config.dart';
import 'package:neocloud_mobile/utils/validation.dart';

// This is a form class module tile widget that shows a modules title and it's order count
// and then it shows the number of schedules the module has and also an add schedules button
class FormModuleTile extends StatefulWidget {
  const FormModuleTile({
    super.key,
    required this.module,
    required this.count,
    required this.pressUpdateModule,
    required this.pressDeleteModule,
  });

  final ClassModuleModel module;
  final int count;
  final Function(ClassModuleModel module, ClassModuleModel newModule) pressUpdateModule;
  final Function(ClassModuleModel module)pressDeleteModule;

  @override
  State<FormModuleTile> createState() => _FormModuleTileState();
}

class _FormModuleTileState extends State<FormModuleTile> {
  final _controller = TextEditingController();
  bool _editMode = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: defaultSize * 2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Count
          SizedBox(width: defaultSize),
          SizedBox(
            width: defaultSize * 3, 
            child: _editMode == false
            ? TextMedium(title: '${widget.count}', color: Colors.black54)
            : SizedBox(),
          ),

          // Column - Title, Row (schedules count, add schedules btn)
          Expanded(child: buildBody())
        ],
      ),
    );
  }

  updateEditMode(bool val) {
    setState(() { _editMode = val; });
  }

  Widget buildBody() {
    return GestureDetector(
      onTap: () => updateEditMode(true),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // title
          _editMode == false 
          ? TextMedium(  title: widget.module.title, color: kBlack80, weight: FontWeight.w500)
          : buildUDModuleInputField(),
    
          // row - schedules count, view schedules
          SizedBox(height: defaultSize * .8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // schedules count
              TextSmall(
                title: '${widget.module.classSchedules?.length ?? 0} Schedules',
                color: Colors.black54,
              ),
    
              // view schedules
              GestureDetector(
                onTap: () => showCreateScheduleDialog(module: widget.module, moduleCount: widget.count, updateModule: widget.pressUpdateModule),
                child: TextSmall(
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


  Row buildUDModuleInputField() {
    return Row(
      children: [
        // Textarea - Edit Title
        Expanded(
          child: Container(
            // color: kRed,
            height: defaultSize * 2.4,
            child: Stack(
              children: [
                Positioned(
                  height: defaultSize * 5,
                  width: SizeConfig.screenWidth! / 1.4,
                  top: -10,
                  child: Container(
                    // color: kGreen,
                    child: FormTextarea(
                      initialValue: widget.module.title,
                      controller: _controller,
                      maxLines: 1,
                      validator: validateRequireField, 
                      press: (_) {}, 
                      autoFocus: _editMode,
                      pressOnKeyboardDone: updateModule,
                      onTapOutside: (_) {
                        // We delay the call of this just incase the user tapped on the delete icon, 
                        // this wouldn't prevent the delete action
                        Future.delayed(const Duration(milliseconds: 300), updateModule);
                      },
                    ),
                  ),
                ),
              ]
            ),
          ),
        ),

        // Icon
        GestureDetector(
          onTap: () {
            print('DELETE ICON TAPPED');
            widget.pressDeleteModule(widget.module);
          },
          child: Icon(Icons.delete_outline, color: kRed.withOpacity(.9), size: defaultSize * 2)
        ),
      ],
    );
  }

  updateModule() {
    widget.pressUpdateModule(widget.module, ClassModuleModel.fromInstance(module: widget.module, title: _controller.text));
    updateEditMode(false);
  }
}
