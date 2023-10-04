import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';

import '../constraints.dart';


/// The `TimeSlider` class is a widget in Dart that displays a slider with selectable time options.
class TimeSlider extends StatefulWidget {
  const TimeSlider({
    super.key,
    required this.items,
    required this.press,
    required this.defaultSelectedIndex,
    this.isMinutesFormat = false,
  });

  // e.g [1, 2, 3,..., 12] or [0, 1, 2, 3, ..., 59] or [AM, PM]
  final List<dynamic> items;
  final Function(int index) press;
  final int defaultSelectedIndex;
  // enables addition of a leading 0 to numbers < 10. e.g 01, 02, .. 09, 10
  final bool isMinutesFormat;

  @override
  State<TimeSlider> createState() => _TimeSliderState();
}

class _TimeSliderState extends State<TimeSlider> {
  late int selectedIndex;

  @override
  void initState() {
    selectedIndex = widget.defaultSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    print(widget.defaultSelectedIndex);

    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Selection - blue background
            Container(
              height: 55,
              width: double.infinity,
              decoration: BoxDecoration(
                color: kBlueLight.withOpacity(.1),
                borderRadius: const BorderRadius.all(Radius.circular(20))
              ),
            ),

            // Slider
            CarouselSlider(
              options: CarouselOptions(
                initialPage: widget.defaultSelectedIndex,
                scrollDirection: Axis.vertical, 
                height: 190,
                enableInfiniteScroll: false,
                viewportFraction: .3,
                onPageChanged: (index, reason) {
                  widget.press(index);
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
              items: widget.items.map((t) {
                // add leading 0 if isMinutesFormat == true
                var title = widget.isMinutesFormat && t.runtimeType == int && t < 10 ? '0$t' : t;

                return Builder(
                  builder: (context) {
                  return Container(
                    // color: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: TextMedium(
                      title: '$title', 
                      color: selectedIndex == widget.items.indexOf(t) ? kBlue : Theme.of(context).canvasColor.withOpacity(.4),
                      weight: selectedIndex == widget.items.indexOf(t) ? FontWeight.w600 : FontWeight.w400,
                      textAlign: TextAlign.center,
                    )
                  );
                });
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}