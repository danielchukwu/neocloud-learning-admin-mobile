import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/components/text_big_small.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/cards/components/tablets.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
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
          : () => const SizedBox(),
      child: Container(
        // padding: screenPadding,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Top Section - Title, Avatar, Body
            const SizedBox(height: 15),
            TheClassworkCard(classwork: classwork),

            // Feedback
            const SizedBox(height: 20),
            showFeedback ? buildClassworkFeedbacks() : const SizedBox(),
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
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 20,
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
                smallTextSize: 16,
              ),
              const SizedBox(
                width: 10,
              ),
              TextBigSmall(
                bigText: '3',
                smallText: 'Feedbacks',
                bigTextColor: kBlack80,
                smallTextColor: kBlack60,
                smallTextSize: 16,
              ),
              const SizedBox(
                width: 10,
              ),
              TextBigSmall(
                bigText: '1',
                smallText: 'Student Left',
                bigTextColor: kBlack80,
                smallTextColor: kBlack60,
                smallTextSize: 16,
              )
            ],
          ),
        ),

        // Feedback Body
        Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: kBlack50, width: .2))),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Notifications List
              Padding(
                padding: const EdgeInsets.only(top: 0),
                child: RoundBoxAvatar(
                    size: 50,
                    image: classwork.clas!.educators![0].avatar ?? ''),
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
                      title: classwork.clas!.educators![0].name ?? '',
                      weight: FontWeight.w600,
                      color: kBlack90,
                    ),

                    // Notification Body
                    const SizedBox(height: 10),
                    TextMedium(title: classwork.body, color: kBlack70),
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
    var faculty = classwork.faculty!;
    var classSchedule = classwork.classSchedule!;
    var module = classwork.classSchedule!.classModule!;

    print(faculty);
    print(classSchedule);
    print(module);

    // List<Map> tabletData = [
    //   {'value': faculty.name, 'color': kOrange},
    //   {'value': 'Module ${module.order} - C${classSchedule.order}' , 'color': kRed},
    //   {'value': 'Due ${classwork.deadline}' , 'color': kBlue},
    // ];

    return Padding(
      padding: screenPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          // TODO: use actual educators when a form that connects everything has been used to connect things up
          buildAvatarAndName(
              // avatar: classwork.clas!.educators![0].avatar,
              // name: classwork.clas!.educators![0].name,
              avatar: defaultProfileAvatar,
              name: 'John Default',
              fontSize: 16,
              weight: FontWeight.w600),

          // Class Title
          const SizedBox(height: 5),
          buildCardHeader(title: classwork.title),

          // Description
          const SizedBox(height: 10),
          TextMedium(title: classwork.body ?? '', color: kBlack70),

          // Bottom Tablets
          const SizedBox(height: 25),
          Row(
            children: [
              IconText(
                title: 'Due August 12 - 3pm',
                icon: Icons.watch,
                iconColor: kBlack70,
                fontSize: 14,
              ),
              const SizedBox(
                width: 20,
              ),
              IconText(
                title: '${classwork.clas!.name!}',
                icon: Icons.school,
                iconColor: kBlack70,
                fontSize: 14,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
