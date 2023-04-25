import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static String screenName = 'Payment';

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextMedium(title: screenName),
    );
  }
}
