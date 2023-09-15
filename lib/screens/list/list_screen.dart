// import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';

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
        bgColor: kWhite,
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
