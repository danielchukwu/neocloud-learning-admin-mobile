import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/finance_card.dart';
import 'package:neocloud_mobile/models/card_data.dart';

class FinanceList extends StatelessWidget {
  FinanceList({
    super.key,
    required this.data,
  });
  final List<Finance> data;

  @override
  Widget build(BuildContext context) {
    return Column(
          children: List.generate(
            data.length,
            (index) => FinanceCard(data: data[index]),
          )
    );
  }
}
