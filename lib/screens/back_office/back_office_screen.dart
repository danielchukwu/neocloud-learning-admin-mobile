import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/options/DisplayOptions.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Options.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';
import 'package:neocloud_mobile/screens/back_office/components/SessionManagerBody.dart';
import 'package:neocloud_mobile/screens/back_office/components/books_body.dart';
import 'package:neocloud_mobile/screens/back_office/components/enquires_body.dart';
import 'package:neocloud_mobile/screens/back_office/components/noticeboard_body.dart';
import 'package:neocloud_mobile/utils.dart';

class BackOfficeScreen extends StatefulWidget {
  const BackOfficeScreen({Key? key}) : super(key: key);
  static String screenName = "Back Office";

  @override
  State<BackOfficeScreen> createState() => _BackOfficeScreenState();
}

class _BackOfficeScreenState extends State<BackOfficeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: BackOfficeScreen.screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: false,
        routeName: getRouteName(ProfileScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: screenPadding,
          child: Column(
            children: <Widget>[
              // Academic Options (Attendance, Class routine, Courses, etc...)
              SizedBox(height: defaultSize),
              DisplayOptions(
                items: BackOfficeOptions.items,
                getSelectedIndex: BackOfficeOptions.getSelectedIndex,
                press: updateSelectedOption,
              ),

              // Books - show this if selected
              BackOfficeOptions.selectedIndex == 0 ? const BooksBody() : const SizedBox(),

              // Session - show if selected

              BackOfficeOptions.selectedIndex == 1 ? const SessionManagerBody() : const SizedBox(),

              // NoticeBoard
              BackOfficeOptions.selectedIndex == 2 ? const NoticeboardBody() : const SizedBox(),

              // Enquires
              BackOfficeOptions.selectedIndex == 3 ? const EnquiriesBody() : const SizedBox(),


              pageBottomPadding(),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }

  // Options - updates option selection
  updateSelectedOption(int index) {
    setState(() {
      BackOfficeOptions.setSelectedIndex(index);
    });
  }
}
