import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/screens/Profile/profile_sceen.dart';

class actionUserButton extends StatelessWidget {
  const actionUserButton({
    super.key,
    this.isDark = false
  });
  final bool  isDark;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor:  (isDark? kBlack : kWhite).withOpacity(.2),
      child: IconButton(
        // splashRadius: defaultSize * 2,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileScreen(),));
        },
        icon: SvgPicture.asset('assets/icons/account.svg', width: 20, color: Colors.white, )

        // icon: Icon(
        //   Icons.account_circle,
        //   color: isDark? kBlack90 : kWhite,
        // ),
      ),
    );
  }
}
