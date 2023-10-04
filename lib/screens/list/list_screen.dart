// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';

// @RoutePage()
class ListScreen extends StatelessWidget {
  const ListScreen({
    Key? key,
    this.screenName = "",
    required this.widgetList,
    this.addScreenPadding = true,
  }) : super(key: key);

  final String screenName;
  final Widget widgetList;
  final bool addScreenPadding;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: screenName,
        bgColor: getColorOpposite(Theme.of(context).canvasColor),
        isDark: true,
        showLeading: true,
        showAction: false,
      ),
      body: SingleChildScrollView(
        padding: addScreenPadding ? screenPadding : EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.only(bottom: 60),
          child: widgetList,
        ),
      ),
    );
  }
}
