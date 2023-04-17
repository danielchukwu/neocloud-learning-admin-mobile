/// Months
List<String> monthsFilter = [
  'January',
  'February',
  'March',
  'April',
  'May',
  'June',
  'July',
  'August',
  'September',
  'October',
  'November',
  'December',
];
String currentMonth = monthsFilter[DateTime.now().month - 1];  // e.g monthsFilter[4]

/// Years
int startYear   = 1993;
int currentYear = DateTime.now().year;
int range = (currentYear + 1) - startYear;

List<String> yearsFilter = List.generate(range, (index) => ("${index + startYear}"));

/// Class
List<String> coursesFilter = [
  'Select a class',
  'Autocad',
  'Basic',
  'Branding',
  'Cloud Computing',
  'Cyber Policy And Governance',
  'Cyber Security',
  'Data Analytics',
  'Data Science',
  'Digital Marketing',
  'Digital Media',
  'Ethical Hacking',
  'Graphic Design',
  'Networking',
  'Social Media Marketing',
  'Software Development',
  'UI/UX Design',
  'Web Design',
  'Web Development',
];

List<String> sectionFilters = [
  'Select section',
  'First',
  'Second',
];

List<String> sessionFilters = [
  'Select session',
  '2020',
  '2021',
  '2022',
  '2023',
];

List<String> statusFilters = [
  'Select status',
  'Paid',
  'Partially Paid',
];

List<String> dateRangeFilters = [
  'Select time period',
  'Today',
  'This Week',
  'This Month',
  'This Year',
  'Old',
];