import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/constants/constants.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';
import 'package:neocloud_mobile/screens/classwork/classwork_screen.dart';

class ClassWorkCard extends StatelessWidget {
  const ClassWorkCard({
    super.key,
    required this.classwork,
    this.enableGestureDecorator = true,
    this.showFeedback = true,
  });

  final ClassworkModel classwork;
  final bool showFeedback;
  final bool enableGestureDecorator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enableGestureDecorator
          ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassWorkScreen(classwork: classwork),
                ),
              )
          : () => SizedBox(),
      child: Container(
        // padding: screenPadding,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Theme.of(context).canvasColor.withOpacity(.5), width: .2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Top Section - Title, Avatar, Body
            SizedBox(height: defaultSize * 1.5),
            TheClassworkCard(classwork: classwork),

            // Feedback
            SizedBox(height: defaultSize * 2),
            showFeedback ? buildClassworkFeedbacks(context) : SizedBox(),
          ],
        ),
      ),
    );
  }

  Column buildClassworkFeedbacks(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Feedback Header
        Container(
          padding: EdgeInsets.symmetric(
            vertical: defaultSize * 1.4,
            horizontal: defaultSize * 2,
          ),
          decoration: BoxDecoration(
              border: Border(
            top: BorderSide(color: kBlack.withOpacity(.2), width: 1),
            bottom: BorderSide(color: kBlack.withOpacity(.2), width: 1),
          )),
          child: Row(
            children: [
              TextBigSmall(
                bigText: '3',
                smallText: 'Submission',
                bigTextColor: Theme.of(context).canvasColor.withOpacity(.8),
                smallTextColor: Theme.of(context).canvasColor.withOpacity(.6),
                smallTextSize: defaultSize * 1.6,
              ),
              SizedBox(
                width: defaultSize,
              ),
              TextBigSmall(
                bigText: '3',
                smallText: 'Feedbacks',
                bigTextColor: Theme.of(context).canvasColor.withOpacity(.8),
                smallTextColor: Theme.of(context).canvasColor.withOpacity(.6),
                smallTextSize: defaultSize * 1.6,
              ),
              SizedBox(
                width: defaultSize,
              ),
              TextBigSmall(
                bigText: '1',
                smallText: 'Student Left',
                bigTextColor: Theme.of(context).canvasColor.withOpacity(.8),
                smallTextColor: Theme.of(context).canvasColor.withOpacity(.6),
                smallTextSize: defaultSize * 1.6,
              )
            ],
          ),
        ),

        // Feedback Body
        Container(
          padding: EdgeInsets.symmetric(
              vertical: defaultSize * 2, horizontal: defaultSize * 1.5),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Theme.of(context).canvasColor.withOpacity(.5), width: .2))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Notifications List
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: RoundBoxAvatar(
                    size: defaultSize * 5,
                    image: classwork.clas!.educators![0].avatar),
              ),

              // Notifications Info
              SizedBox(
                width: defaultSize * 1.5,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Users Full Name
                    TextLarge(
                      title: classwork.clas!.educators![0].name,
                      weight: FontWeight.w600,
                      color: Theme.of(context).canvasColor.withOpacity(.9),
                    ),

                    // Notification Body
                    SizedBox(height: defaultSize),
                    TextMedium(title: classwork.body, color: Theme.of(context).canvasColor.withOpacity(.7)),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class TheClassworkCard extends StatelessWidget {
  const TheClassworkCard({
    super.key,
    required this.classwork,
  });

  final ClassworkModel classwork;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: defaultSize),
          // TODO: use actual educators when a form that connects everything has been used to connect things up
          CircularAvartarAndName(
              // avatar: classwork.clas!.educators![0].avatar,
              // name: classwork.clas!.educators![0].name,
              avatar: defaultProfileAvatar,
              name: 'John Default',
              fontSize: defaultSize * 1.6,
              weight: FontWeight.w600),

          // Class Title
          SizedBox(height: defaultSize * .5),
          buildCardHeader(title: classwork.title),

          // Description
          SizedBox(height: defaultSize),
          TextMedium(title: classwork.body, color: Theme.of(context).canvasColor.withOpacity(.7)),

          // Bottom Tablets
          SizedBox(height: defaultSize * 2.5),
          Row(
            children: [
              IconText(
                title: 'Due August 12 - 3pm',
                icon: Icons.watch,
                iconColor: Theme.of(context).canvasColor.withOpacity(.7),
                fontSize: defaultSize * 1.4,
              ),
              SizedBox(
                width: defaultSize * 2,
              ),
              IconText(
                title: '${classwork.clas!.name!}',
                icon: Icons.school,
                iconColor: Theme.of(context).canvasColor.withOpacity(.7),
                fontSize: defaultSize * 1.4,
              ),
            ],
          ),
          
        ],
      ),
    );
  }
}
