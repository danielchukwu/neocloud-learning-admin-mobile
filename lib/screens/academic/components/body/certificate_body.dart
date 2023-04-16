import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/card_data.dart';
import 'package:neocloud_mobile/screens/academic/components/list/certificate_list.dart';


class CertificateBody extends StatelessWidget {
  const CertificateBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // + Add Button and List of CARDS
        SizedBox(height: defaultSize * 3),
        CertificateList(data: certificatesList),
      ],
    );
  }
}
