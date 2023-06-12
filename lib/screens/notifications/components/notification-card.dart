import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/Notification.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.typeColor,
  });

  final AppNotification notification;
  final Color? typeColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: defaultSize * 2, horizontal: defaultSize * 1.5),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: kBlack50, width: .2)
        )
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Notifications List
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: RoundBoxAvatar(width: defaultSize * 5, height: defaultSize * 5, image: notification.user.avatar),
          ),

          // Notifications Info
          SizedBox(width: defaultSize * 1.5,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Users Full Name
                TextLarge(title: notification.user.fullName, weight: FontWeight.w600, color: kBlack90,),
          
                // Notification Type (type - date)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    // Class Week - Class Count
                    TextMedium(title: notification.type, color: typeColor, weight: FontWeight.w500),
                    // Live or Time it's coming
                    TextMedium(title: notification.dueDate ?? '', color: kBlack70, weight: FontWeight.w500),
                  ],
                ),
          
                // Notification Body
                SizedBox(height: defaultSize),
                TextMedium(title: notification.body, color: kBlack70),
          
              ],
            ),
          )
        ],
      ),
    );
  }
}
