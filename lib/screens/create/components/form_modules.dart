import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:neocloud_mobile/screens/create/components/form_module_inputfield.dart';
import 'package:neocloud_mobile/screens/create/components/form_module_tile.dart';

/// This widget displays the modules (or curriculum) of a class, it is also used
/// to further add more modules,add schedules for those modules and delete modules
class FormModules extends StatefulWidget {
  const FormModules(
      {super.key, required this.modules, required this.scrollController});

  final List<ClassModuleModel> modules;
  final ScrollController scrollController;

  @override
  State<FormModules> createState() => _FormModulesState();
}

class _FormModulesState extends State<FormModules> {
  late List<ClassModuleModel> _modules;

  @override
  void initState() {
    super.initState();
    _modules = widget.modules;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: defaultSize * 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Header - Icon and Title
          buildHeader(),

          // Column - List of class modules (curriculum)
          Column(
            children: List.generate(
              _modules.length,
              (index) => FormModuleTile(
                module: _modules[index],
                count: index + 1,
                pressDeleteModule: deleteModule,
                pressUpdateModule: updateModule,
              ),
            ),
          ),

          // Input - Module TextArea and Add Button
          FormModuleInputField(press: addModule, count: _modules.length + 1),
        ],
      ),
    );
  }

  updateModule(ClassModuleModel module, ClassModuleModel newModule) {
    for (var i = 0; i < _modules.length; i++) {
      if (_modules[i].id == module.id) {
        setState(() { _modules[i] = newModule; });
      }
    }
  }

  deleteModule(module) {
    setState(() => _modules.remove(module) );

    // for (var i = 0; i < _modules.length; i++) {
    //   if (_modules[i].id == module.id) {
    //     print('REMOVING AT: $i');
    //     setState(() { _modules.removeAt(i); });
    //   }
    // }
  }

  void addModule(String value) {
    scrollToBottom();

    if (value.isNotEmpty) {
      var newModule = ClassModuleModel(
          id: '${_modules.length + 1}', title: value, classSchedules: []);
      setState(() {
        _modules.add(newModule);
      });
    }
  }

  scrollToBottom() {
    var scrollController = widget.scrollController;
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 600), curve: Curves.easeOut);
  }

  Widget buildHeader() {
    return IconText(
      title: 'Modules (Curriculum)',
      color: Colors.black54,
      fontWeight: FontWeight.w500,
      icon: Icons.schema_outlined,
      iconColor: kBlack60,
      iconSize: defaultSize * 1.8,
      spaceBetweenSize: defaultSize * 1,
    );
  }
}
