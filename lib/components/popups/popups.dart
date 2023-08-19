import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';


showTopAlertDialog({required String text, bool isError = true}) {
  // Animation Controller
  AnimationController controller = AnimationController(
    vsync: Navigator.of(SizeConfig.appContext!).overlay!,
    duration: Duration(milliseconds: 150),
  );

  OverlayEntry overlayEntry;

  overlayEntry = OverlayEntry(builder: (context) {
    controller.forward();
    
    return Positioned(
      child: FadeTransition(
        opacity: Tween<double>(begin: 0, end: 1).animate(controller),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, -.43),
            end: Offset(0, -.40),
          ).animate(controller),
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: defaultSize * 1, horizontal: defaultSize * 1.5),
              constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width / 1.3,),
              decoration: BoxDecoration(
                color:  isError ? const Color(0xFFeb4d4b) : const Color(0xFF1dd1a1),
                borderRadius: BorderRadius.all(Radius.circular(defaultSize * .8))
              ),
              child: TextMedium(title: text, color: kWhite, textAlign: TextAlign.center),
            ),
          ),
        ),
      ),
    );
  });

  Future.delayed(Duration(seconds: 3), () {
    controller.reverse();
    Future.delayed(Duration(milliseconds: 500), () => overlayEntry.remove());
  });

  Overlay.of(SizeConfig.appContext!).insert(overlayEntry);
}


showCenterAlertDialog(BuildContext context) {
  return showDialog(
    // barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(defaultSize * .5)),
            color: kRed,
          ),
          child: TextMedium(
            title: 'An Error Just Occured!',
          ),
        ),
      );
    },
  );
}