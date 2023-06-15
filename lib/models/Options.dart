class Option {
  final String title;
  // This will be used for knowing when to show current data for an option or old data
  // e.g current classworks and old classworks. if this is true, then we'll show current classworks else old classworks
  bool selectedCurrent;

  Option({
    required this.title, 
    this.selectedCurrent = true
  });
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
    Option(title: "Classes"),
    Option(title: "Faculties"),
    Option(title: "Classworks"),
    Option(title: "Class Schedules"),
  ];
}
