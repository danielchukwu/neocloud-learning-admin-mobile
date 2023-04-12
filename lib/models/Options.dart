class Option {
  final String title;

  const Option({required this.title});
}

// This will be extended for the purpose of type checking
class OptionsObject {}

class AcademicOptions extends OptionsObject {
  static int selectedIndex = 0;

  static setSelectedIndex(int index) => selectedIndex = index;
  static int getSelectedIndex() => selectedIndex;
  // static int get selectedOption => _selectedOption;

  // Try to make sure the items are always divisible by 2
  static List<Option> items = [
    Option(title: "Attendance"),
    Option(title: "Class routine"),
    Option(title: "Courses"),
    Option(title: "Syllabus"),
    Option(title: "Certificate"),
    Option(title: "Faculty"),
    Option(title: "Class"),
    Option(title: "Event Calendar"),
  ];
}