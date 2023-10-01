// import 'package:flutter/material.dart';
// import 'package:neocloud_mobile/components/buttons.dart';
// import 'package:neocloud_mobile/components/texts.dart';
// import 'package:neocloud_mobile/constraints.dart';
// import 'package:neocloud_mobile/screens/comming_soon/comming_soon_screen.dart';

// class GrantPermission extends StatelessWidget {
//   const GrantPermission({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         // Grant Permission
//         const SizedBox(height: 30),
//         Padding(
//           padding: screenPadding,
//           child: TextCustom(
//             title: "Grant Permission",
//             fontSize: 22,
//             color: kBlack80,
//             weight: FontWeight.w600,
//           ),
//         ),
//         const SizedBox(height: 20),

//         // Thumbs up and Text
//         Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             const SizedBox(width: 40),
//             const Image(
//               image: AssetImage('assets/icons/thumbs-up.png'),
//               width: 50,
//             ),
//             const SizedBox(width: 20),
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   TextMedium(
//                     title:
//                         'Grant Permission for Students or Educators to be able to take certain courses at NCT',
//                     color: kBlack60,
//                   ),
//                   const SizedBox(height: 20),
//                   AppsButton(
//                     title: 'Grant',
//                     // press: (context) => context.router.push(const ComingSoonRoute()),
//                     press: (_) => Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (_) => const ComingSoonScreen(),
//                         )),
//                     bgColor: kBlue,
//                     padTopBottom: 5,
//                     borderRadius: 40,
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(width: 40),
//           ],
//         ),
//         const SizedBox(
//           height: 50,
//         )
//       ],
//     );
//   }
// }
