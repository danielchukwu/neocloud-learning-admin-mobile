import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/buttons.dart';
import 'package:neocloud_mobile/components/cards/book_card.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';

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
        SizedBox(height: defaultSize * 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: AppsButton(
                title: "Book Issues",
                press: (context) {},
                icon: Icons.book_online_rounded,
                bgColor: kBlack50,
                padTopBottom: defaultSize * 0.3,
                borderRadius: buttonBorderRadius,
              ),
            ),
            SizedBox(width: defaultSize),
            Expanded(child: buildAddButton(title: "Add Invoice", press: (context) {})),
          ],
        ),

        // list of cards
        Column(
          children: List.generate(booksList.length, (index) => BookCard(data: booksList[index])),
        ),
      ],
    );
  }
}