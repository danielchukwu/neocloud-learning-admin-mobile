class ProfileNavbarItem {
  final String title;
  final String iconSrc;

  ProfileNavbarItem({required this.title, required this.iconSrc});
}

class ProfileNavbarItems {
  static int _selectedIndex = 0;

  static set selectedIndex(int index) => _selectedIndex = index;
  static int get selectedIndex => _selectedIndex;

  static List<ProfileNavbarItem> items = [
    ProfileNavbarItem(title: "courses", iconSrc: "assets/icons/courses.svg"),
    ProfileNavbarItem(title: "activities", iconSrc: "assets/icons/activities.svg"),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/about.svg"),
  ];
  static List<ProfileNavbarItem> studentItems = [
    ProfileNavbarItem(title: "courses", iconSrc: "assets/icons/courses.svg"),
    ProfileNavbarItem(title: "activities", iconSrc: "assets/icons/activities.svg"),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/about.svg"),
  ];
  static List<ProfileNavbarItem> educatorItems = [
    ProfileNavbarItem(title: "courses", iconSrc: "assets/icons/courses.svg"),
    ProfileNavbarItem(title: "activities", iconSrc: "assets/icons/activities.svg"),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/about.svg"),
  ];
  static List<ProfileNavbarItem> adminItems = [
    ProfileNavbarItem(title: "courses", iconSrc: "assets/icons/courses.svg"),
    ProfileNavbarItem(title: "activities", iconSrc: "assets/icons/activities.svg"),
    ProfileNavbarItem(title: "info", iconSrc: "assets/icons/about.svg"),
  ];
}