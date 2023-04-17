import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/bottom_navbar/apps_bottom_navbar.dart';
import 'package:neocloud_mobile/components/cards/book_issue_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/utils.dart';

class BookIssuesScreen extends StatefulWidget {
  const BookIssuesScreen({Key? key}) : super(key: key);
  static String screenName = "Book Issues";

  @override
  State<BookIssuesScreen> createState() => BookIssuesScreenState();
}

class BookIssuesScreenState extends State<BookIssuesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(
        title: BookIssuesScreen.screenName,
        bgColor: kWhite,
        isDark: true,
        showLeading: true,
        routeName: getRouteName(BookIssuesScreen.screenName),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: screenPadding,
          child: Column(
            children: <Widget>[
              // + Add Button
              SizedBox(height: defaultSize * 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  buildAddButton(title: "Create Book Issue", press: (context) {}),
                ],
              ),

              // list of cards
              Column(
                children: List.generate(bookIssuesList.length, (index) => BookIssueCard(data: bookIssuesList[index])),
              ),

              pageBottomPadding(),
            ],
          ),
        ),
      ),
      extendBody: true,
      bottomNavigationBar: const AppsBottomNavBar(),
    );
  }
}