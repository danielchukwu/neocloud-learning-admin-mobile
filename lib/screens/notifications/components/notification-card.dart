import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/graphql/models/NotificationModel.dart';
import 'package:neocloud_mobile/utils/utils.dart';

class NotificationCard extends StatefulWidget {
  const NotificationCard({
    super.key,
    required this.notification,
    required this.typeColor,
  });

  final NotificationModel notification;
  final Color? typeColor;

  @override
  State<NotificationCard> createState() => _NotificationCardState();
}

class _NotificationCardState extends State<NotificationCard> {
  Color _containerColor = kBlueLight.withOpacity(.3);
  final _animationDuration = const Duration(seconds: 2);

  void _startAnimation(bool seen) {
    // Perform animation if notification have not been seen by user
    if (seen == false) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        setState(() {
          _containerColor = Colors.transparent;
        });
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _startAnimation(widget.notification.seen);
  }

  @override
  Widget build(BuildContext context) {
    var notification = widget.notification;

    return AnimatedContainer(
      duration: _animationDuration,
      decoration: BoxDecoration(
          color: notification.seen ? Colors.transparent : _containerColor,
          border: Border(bottom: BorderSide(color: Theme.of(context).canvasColor.withOpacity(.5), width: .2))),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // Notifications List
          Padding(
            padding: const EdgeInsets.only(top: 0),
            child: RoundBoxAvatar(size: 50, image: notification.user.avatar),
          ),

          // Notifications Info
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Users Full Name
                TextLarge(
                  title: notification.user.name,
                  weight: FontWeight.w600,
                  color: Theme.of(context).canvasColor.withOpacity(.9),
                ),

                // Notification Type
                // SizedBox(height: 2),
                TextMedium(
                    title: notification.type.name,
                    color: widget.typeColor,
                    weight: FontWeight.w500),

                // Notification Body
                const SizedBox(height: 5),
                // TextMedium(title: notification.body + '. ${getTimeAgo(notification.createdAt)}', color: kBlack70),
                Text.rich(TextSpan(
                    style: appsTextStyle(
                        color: Theme.of(context).canvasColor.withOpacity(.7), fontWeight: FontWeight.w400),
                    children: [
                      TextSpan(text: notification.body),
                      TextSpan(
                          text: '  ${getTimeAgo(notification.createdAt)}',
                          style: appsTextStyle(
                              color: Theme.of(context).canvasColor.withOpacity(.5),
                              fontWeight: FontWeight.w400,
                              fontSize: 14))
                    ]))
              ],
            ),
          )
        ],
      ),
    );
  }
}
