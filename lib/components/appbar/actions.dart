import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/images.dart';
import 'package:neocloud_mobile/constraints.dart';

class actionUserButton extends StatelessWidget {
  const actionUserButton({
    required this.routeName, 
    super.key,
    this.icon,
    this.svg,
    this.routeWidget,
  });

  // either <svg> or <icon> is required for in other for something
  // to be displayed
  final IconData? icon;
  final String? svg;
  // the route to be navigated to when this action button is clicked on
  final String routeName;
  // 
  final Widget? routeWidget;
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (routeName.length == 0 && routeWidget != null){
            // Push
            // return navigateToScreenPush(context: context, widget: routeWidget!);
            Navigator.push(context, MaterialPageRoute(builder: (context) => routeWidget!,));
            return;
          }
          Navigator.pushNamed(context, routeName);
        },
        child: Container(
          color: Colors.transparent,
          padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
          child: svg != null
            ? IconOrSvg(svg: svg!, size: defaultSize * 2.5,)
            : IconOrSvg(icon: icon!, size: defaultSize * 2.5),
        )
    );
  }
}