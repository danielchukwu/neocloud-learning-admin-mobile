import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class SearchHeader extends StatelessWidget {
  const SearchHeader({super.key, required this.updateSearch});

  final Function(String value) updateSearch;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Back Button
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
                horizontal: defaultSize * 2, vertical: defaultSize),
            child: IconOrSvg(
              icon: Icons.arrow_back_ios,
              size: defaultSize * 2.5,
            ),
          ),
        ),
        // Search Field
        Expanded(
          child: buildSearchTextField(press: updateSearch),
        ),
        SizedBox(width: defaultSize * 2),
      ],
    );
  }
}