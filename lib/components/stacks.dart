import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/core/utils/utils.dart';

// Requires a container or box with a certain width
class StackedImages extends StatelessWidget {
  const StackedImages({
    super.key,
    required this.imgList,
    required this.length,
    this.imgSize = 35,
    this.stackRight = false,
    this.overlapDifference = 30,
  });

  // Takes a list containing String urls of images to be displayed in the stack
  final List<String> imgList;
  // This specifies the images sizes to be displayed in the stack
  final double imgSize;
  // This is basically the entire length of the profiles, and it is used to display
  // e.g +2, +3 or some number
  final int length;
  // This determines whether the images stack up to the left or to the right
  final bool stackRight;
  // Overlap
  final double overlapDifference;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imgSize,
      child: Stack(
        children: <Widget>[
              // Round - count
              length > 3
                  ? Positioned(
                      right: 0,
                      child: Container(
                        width: imgSize,
                        height: imgSize,
                        decoration: BoxDecoration(
                            color:
                                Theme.of(context).canvasColor.withOpacity(.8),
                            borderRadius:
                                BorderRadius.circular(defaultSize * 5),
                            border: Border.all(
                              width: defaultSize * .2,
                              color: getColorOpposite(
                                  Theme.of(context).canvasColor),
                            )),
                        child: Center(
                          child: Text(
                            "+${length - 3}",
                            style: TextStyle(
                              color: getColorOpposite(
                                  Theme.of(context).canvasColor),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox(),
            ] +
            List<Widget>.generate(
              imgList.length,
              (index) =>
                  // Round Avatar 🧔🏻‍♂️
                  Positioned(
                right: length > 3
                    ? (index + 1) * overlapDifference
                    : index *
                        overlapDifference, // overlapDifference = 30 default
                child: RoundBoxAvatar(
                  size: imgSize,
                  image: imgList[index],
                  borderSize: .2,
                ),
              ),
            ),
      ),
    );
  }
}

class StackedImageAndDot extends StatelessWidget {
  StackedImageAndDot({
    super.key,
    required this.img,
    required this.text,
    this.imgSize = 55,
    this.dotColor,
    this.dotSize = 25,
    this.stackSize = 60,
  });

  final String img;
  final double imgSize;
  final String text;
  late Color? dotColor;
  final double dotSize;
  final double stackSize;

  @override
  Widget build(BuildContext context) {
    dotColor ??= Theme.of(context).canvasColor.withOpacity(.8);
    return Container(
      height: imgSize,
      width: stackSize,
      // color: Colors.amber,
      child: Stack(
        children: [
          RoundBoxAvatar(size: imgSize, image: img),

          // Round Info Box (is stacked ontop of the avatar)
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: defaultSize * 2.7,
              height: defaultSize * 2.7,
              decoration: BoxDecoration(
                  color: dotColor,
                  borderRadius: BorderRadius.circular(imgSize),
                  border: Border.all(
                      color: getColorOpposite(Theme.of(context).canvasColor),
                      width: defaultSize * .2)),
              child: Center(
                child: Text(text,
                    style: TextStyle(
                        color: getColorOpposite(Theme.of(context).canvasColor),
                        fontWeight: FontWeight.w600)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
