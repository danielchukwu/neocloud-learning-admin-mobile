import 'package:neocloud_mobile/constraints.dart';

class ProfileNavbarItem {
  final String title;
  final String iconSrc;
  final double size;

  ProfileNavbarItem({required this.title, required this.iconSrc, required this.size});
}

class ProfileNavbarItems {
  static int _selectedIndex = 0;

  static set selectedIndex(int index) => _selectedIndex = index;
  static int get selectedIndex => _selectedIndex;

  static List<ProfileNavbarItem> items = [
    ProfileNavbarItem(title: "dashboard", iconSrc: "assets/icons/profile/laptop.svg", size: defaultSize * 2.7),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/profile/info-square.svg", size: defaultSize * 2.5),
    ProfileNavbarItem(title: "classes", iconSrc: "assets/icons/profile/courses.svg", size: defaultSize * 2.3),
  ];
  static List<ProfileNavbarItem> studentItems = [
    ProfileNavbarItem(title: "dashboard", iconSrc: "assets/icons/profile/laptop.svg", size: defaultSize * 2.7),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/profile/info-square.svg", size: defaultSize * 2.5),
    ProfileNavbarItem(title: "classes", iconSrc: "assets/icons/profile/courses.svg", size: defaultSize * 2.3),
  ];
  static List<ProfileNavbarItem> educatorItems = [
    ProfileNavbarItem(title: "dashboard", iconSrc: "assets/icons/profile/laptop.svg", size: defaultSize * 2.7),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/profile/info-square.svg", size: defaultSize * 2.5),
    ProfileNavbarItem(title: "classes", iconSrc: "assets/icons/profile/courses.svg", size: defaultSize * 2.3),
  ];
  static List<ProfileNavbarItem> adminItems = [
    ProfileNavbarItem(title: "dashboard", iconSrc: "assets/icons/profile/laptop.svg", size: defaultSize * 2.7),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/profile/info-square.svg", size: defaultSize * 2.5),
    ProfileNavbarItem(title: "classes", iconSrc: "assets/icons/profile/courses.svg", size: defaultSize * 2.3),
  ];
}