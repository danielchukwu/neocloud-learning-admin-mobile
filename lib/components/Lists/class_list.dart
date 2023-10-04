import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/cards/class_card.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:neocloud_mobile/graphql/services/class_service.dart';
import 'package:neocloud_mobile/components/widgets.dart';

class ClassList extends StatelessWidget {
  const ClassList({
    Key? key,
    this.classList,
    this.showClassAvatar = false,
    this.bodySeparationSize = 15,
    this.spinnerScreeMaxHeight,
  }) : super(key: key);

  final List<ClassEntity> ? classList;
  final bool showClassAvatar;
  final double bodySeparationSize;
  final double? spinnerScreeMaxHeight;


  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        if (classList == null){
          return spinnerScreen(context: context);
        }
        if (classList!.isEmpty) {
          return nothingWasFoundScreen(context: context, screenMaxHeight: spinnerScreeMaxHeight);
        }

        if (classList != null) {
          return Column(
            children: List.generate(
              classList!.length,
              (index) => ClassCard(
                clas: classList![index],
                showClassAvatar: showClassAvatar,
                bodySeparationSize: bodySeparationSize,
              ),
            ),
          );
        }
        return TextMedium(title: 'Fix',);
      },
    );    
  }

  
}
