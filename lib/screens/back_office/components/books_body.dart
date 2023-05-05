import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/book_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/book_issues/books_issue_screen.dart';
import 'package:neocloud_mobile/utils.dart';

class BooksBody extends StatefulWidget {
  const BooksBody({Key? key}) : super(key: key);

  @override
  State<BooksBody> createState() => BooksBodyState();
}

class BooksBodyState extends State<BooksBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // 📄 Book Issue and + Add Button
        SizedBox(height: defaultSize * 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AppsButton(
                title: "Book Issues",
                press: (context) {
                  navigateToScreen(context: context!, routeName: '/book-issues');
                },
                icon: Icons.book_online_rounded,
                bgColor: kBlack50,
                padTopBottom: defaultSize * 0.3,
                borderRadius: buttonBorderRadius,
              ),
            ),
            SizedBox(width: defaultSize),
            Expanded(child: buildAddButton(title: "Add Book", press: (context) {})),
          ],
        ),

        // list of cards
        SizedBox(height: defaultSize * 2),
        Column(
          children: List.generate(booksList.length, (index) => BookCard(data: booksList[index])),
        ),
      ],
    );
  }
}