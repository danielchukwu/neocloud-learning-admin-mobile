import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/size_config.dart';

Widget appsCircularProgressIndicator() {
  return SizedBox(
    width: defaultSize * 2,
    height: defaultSize * 2,
    child:
        const CircularProgressIndicator(strokeWidth: 3, color: Colors.black38),
  );
}

Widget spinnerScreen({double? screenMaxHeight}){
  screenMaxHeight ??= SizeConfig.screenHeight! / 2;
  
  return Container(
    // color: Colors.red,
    constraints: BoxConstraints(maxHeight: screenMaxHeight),
    child: Center(child: appsCircularProgressIndicator()),
  );
}

Widget nothingWasFoundScreen({double? screenMaxHeight}){
  screenMaxHeight ??= SizeConfig.screenHeight! / 2;
  
  return Container(
    constraints: BoxConstraints(maxHeight: screenMaxHeight),
    child: const Center(child: TextExtraLarge(title: 'Nothing was found', color: Colors.black38, weight: FontWeight.w600,)),
  );
}
