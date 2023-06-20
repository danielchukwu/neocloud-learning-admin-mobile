import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';
import 'package:neocloud_mobile/screens/classwork/classwork_screen.dart';

class ClassWorkCard extends StatelessWidget {
  const ClassWorkCard({
    super.key,
    required this.clas,
    this.enableGestureDecorator = true,
    this.showFeedback = true,
  });

  final ClassWork clas;
  final bool showFeedback;
  final bool enableGestureDecorator;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: enableGestureDecorator
          ? () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ClassWorkScreen(classwork: clas),
                ),
              )
          : () => SizedBox(),
      child: Container(
        // padding: screenPadding,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Top Section - Title, Avatar, Body
            SizedBox(height: defaultSize * 1.5),
            buildClassworkCard(clas: clas),

            // Feedback
            SizedBox(height: defaultSize * 2),
            showFeedback ? buildClassworkFeedbacks() : SizedBox(),
          ],
        ),
      ),
    );
  }

  Column buildClassworkFeedbacks() {
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
                bigTextColor: kBlack80,
                smallTextColor: kBlack60,
                smallTextSize: defaultSize * 1.6,
              ),
              SizedBox(
                width: defaultSize,
              ),
              TextBigSmall(
                bigText: '3',
                smallText: 'Feedbacks',
                bigTextColor: kBlack80,
                smallTextColor: kBlack60,
                smallTextSize: defaultSize * 1.6,
              ),
              SizedBox(
                width: defaultSize,
              ),
              TextBigSmall(
                bigText: '1',
                smallText: 'Student Left',
                bigTextColor: kBlack80,
                smallTextColor: kBlack60,
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
              border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Notifications List
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: RoundBoxAvatar(
                    width: defaultSize * 5,
                    height: defaultSize * 5,
                    image: clas.educator.avatar),
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
                      title: clas.educator.fullName,
                      weight: FontWeight.w600,
                      color: kBlack90,
                    ),

                    // Notification Body
                    SizedBox(height: defaultSize),
                    TextMedium(title: clas.description, color: kBlack70),
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

class buildClassworkCard extends StatelessWidget {
  const buildClassworkCard({
    super.key,
    required this.clas,
  });

  final ClassWork clas;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Due - Tomorrow
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              TextSmall(title: 'Due - Wed (Tomorrow)', color: kBlack50),
            ],
          ),

          // Class Title
          SizedBox(height: defaultSize * .5),
          buildCardHeader(title: clas.title),

          SizedBox(height: defaultSize),
          buildAvatarAndName(
              avatar: clas.educator.avatar,
              name: clas.educator.fullName,
              fontSize: defaultSize * 1.6,
              weight: FontWeight.w600),

          // Description Label
          // CardDescription(label: "Description", content: data.description),
          SizedBox(height: defaultSize),
          TextMedium(title: clas.description, color: kBlack70),
        ],
      ),
    );
  }
}

// class ClassWorkFeedbacks extends StatelessWidget {
//   const ClassWorkFeedbacks({
//     super.key,
//     required this.clas,
//   });

//   final ClassWork clas;

//   @override
//   Widget build(BuildContext context) {
//     return 
//   }
// }
