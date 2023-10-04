import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/appbar/appbar.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/dashboard/components/section_one.dart';

class Body extends StatelessWidget {
  Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        AppsSliverAppBar(
          title: "Dashboard",
          elevation: .1,
          showLeading: false,
          showAction1: false,
          showAction2: false,
        ),
        SliverToBoxAdapter(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Section 1 (Intro dashboard)
            
            DashboardSlider(),

            // // Section 2
            // SizedBox(height: 20),
            // PersonelDashboard(),

            // // buildGrantPermission(),
            // GrantPermission(),
          ],
        )),
      ],
    );
  }
}

class DashboardSlider extends StatefulWidget {
  const DashboardSlider({super.key});

  @override
  State<DashboardSlider> createState() => _DashboardSliderState();
}

class _DashboardSliderState extends State<DashboardSlider> {
  int selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CarouselSlider(
          options: CarouselOptions(
            initialPage: 1,
            viewportFraction: 1,
            height: 300,
            enableInfiniteScroll: true,
            onPageChanged: (index, reason) {
              setState(() {
                selectedIndex = index;
              });
            },
          ),
          items: const [
            Center(child: Text('AnotherOne')),
            AttendanceClassesCwDashboard(),
            Center(child: Text('AnotherThree')),
          ],
        ),

        // Indicator ... for letting users know interface is swipe able
        const SizedBox(height: 20),
        buildRoundDot(selectedIndex),
      ],
    );
  }

  Row buildRoundDot(int selectedIndex) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 7,
          width: 7,
          decoration: BoxDecoration(
            color: index == selectedIndex ? kBlueLight : Theme.of(context).canvasColor.withOpacity(.2),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
        ),
      ),
    );
  }
}
