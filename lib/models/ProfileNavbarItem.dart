class ProfileNavbarItem {
  final String iconSrc;

  ProfileNavbarItem({required this.iconSrc});
}

class ProfileNavbarItems {
  static int _selectedIndex = 0;

  static set selectedIndex(int index) => _selectedIndex = index;
  static int get selectedIndex => _selectedIndex;

  static List<ProfileNavbarItem> items = [
    ProfileNavbarItem(iconSrc: "assets/icons/courses.svg"),
    ProfileNavbarItem(iconSrc: "assets/icons/activities.svg"),
    ProfileNavbarItem(iconSrc: "assets/icons/about.svg"),
  ];
}