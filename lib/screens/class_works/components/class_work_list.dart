import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_works_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class ClassWorkList extends StatefulWidget {
  ClassWorkList({
    super.key,
    required this.data,
  });

  final List<ClassWork> data;

  @override
  State<ClassWorkList> createState() => _ClassWorkListState();
}

class _ClassWorkListState extends State<ClassWorkList> {
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController(text: "");

    _searchController.addListener(() {
      // Filter and fetch data if necessary
      print(_searchController.text);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(widget.data.length,
              (index) => ClassWorkCard(clas: widget.data[index])),
        );
  }

  updateSearchController(String value) {
    setState(() {
      _searchController.text = value;
    });
  }
}
