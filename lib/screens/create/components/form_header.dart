import 'package:flutter/material.dart';

import '../../../components/texts.dart';
import '../../../constraints.dart';

class FormHeader extends StatelessWidget {
  const FormHeader({
    super.key,
    this.title = '',
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Title
          Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: Theme.of(context).canvasColor.withOpacity(.8))),
          // Cancel Button
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(Icons.close, color: Theme.of(context).canvasColor.withOpacity(.8), size: 30,)),
        ],
      ),
    );
  }
}