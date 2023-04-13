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
  'December'
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
  'autocad',
  'basic',
  'branding',
  'cloud computing',
  'cyber policy and governance',
  'cybersecurity',
  'data analytics',
  'data science',
  'digital marketing',
  'digital media',
  'ethical hacking',
  'graphic design',
  'networking',
  'social media marketing',
  'software development',
  'ui/ux design',
  'web design',
  'web development',
];

List<String> sectionFilters = [
  'Select section',
  'First',
  'Second',
];