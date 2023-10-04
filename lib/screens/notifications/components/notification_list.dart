import 'package:flutter/material.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/NotificationModel.dart';
import 'package:neocloud_mobile/screens/notifications/components/notification-card.dart';

class NotificationList extends StatelessWidget {
  const NotificationList({super.key, required this.dataList});

  final List<NotificationModel> dataList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
          dataList.length,
          (index) => NotificationCard(
              notification: dataList[index], typeColor: Theme.of(context).canvasColor.withOpacity(.7))),
    );
  }
}
