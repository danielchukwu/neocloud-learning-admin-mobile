// CLASS WORK
class AppData {
  AppData({required this.id});
  final String id;
}
class ClassWork extends AppData {
  ClassWork({
    required super.id,
    required this.title,
    required this.description,
    required this.course,
    required this.file,
    required this.date,
  });
  final String title;
  final String description;
  final String course;
  final String file;
  final String date;
}
// Class work objects
List<ClassWork> classWorksList = [
  ClassWork(
    id: "1",
    title: "Build an Ecommerce Platform",
    description:
    "In 1 month build out a full fledged Ecommerce application using the below technologies: Flutter, Firebase",
    course: "Cyber Policy and Government",
    file: "assets/images/nct-meeting.png",
    date: "May 3",
  ),
  ClassWork(
    id: "2",
    title: "Build an Ecommerce Platform",
    description:
    "In 1 month build out a full fledged Ecommerce application using the below technologies: Flutter, Firebase",
    course: "Cyber Policy and Government",
    file: "assets/files/nct-meeting.pdf",
    date: "Jan 25",
  ),
  ClassWork(
    id: "3",
    title: "Create a Chatbot",
    description:
    "In 2 weeks, build a chatbot using Dialogflow and integrate it with your website.",
    course: "Artificial Intelligence",
    file: "assets/images/nct-meeting.png",
    date: "Apr 15",
  ),
  ClassWork(
    id: "4",
    title: "Design a Website",
    description:
    "Create a responsive website for a client using HTML, CSS, and JavaScript.",
    course: "Web Development",
    file: "assets/files/nct-meeting.pdf",
    date: "Jun 7",
  ),
  ClassWork(
    id: "5",
    title: "Develop a Mobile App",
    description:
    "In 4 weeks, develop a mobile app for a local business using React Native.",
    course: "Mobile App Development",
    file: "assets/files/nct-meeting.pdf",
    date: "Jul 2",
  ),
];


// ATTENDANCE
class Attendance extends AppData {
  Attendance({
    required super.id,
    required this.clas,
    required this.attendance,
    required this.createdAt,
  });

  final String clas;
  final int attendance;
  final String createdAt;
}
// Attendance objects
List<Attendance> attendanceList = [
  Attendance(id: '1', clas: 'Maths', attendance: 90, createdAt: '2023-04-11'),
  Attendance(id: '2', clas: 'Science', attendance: 80, createdAt: '2023-03-10'),
  Attendance(id: '3', clas: 'English', attendance: 95, createdAt: '2022-09-09'),
  Attendance(id: '4', clas: 'Social Studies', attendance: 85, createdAt: '2022-05-08'),
  Attendance(id: '5', clas: 'History', attendance: 75, createdAt: '2022-03-07'),
];


// CLASS ROUTINE
class ClassRoutine extends AppData {
  ClassRoutine({
    required super.id,
    required this.clas,
    required this.subject,
    required this.educator,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
  });

  final String clas;
  final String subject;
  final String educator;
  final String startTime;
  final String endTime;
  final String createdAt;
}
// Class routine objects
List<ClassRoutine> classRoutineList = [
  ClassRoutine(id: '1', clas: 'Maths', subject: 'Algebra', educator: 'Faith Okeke', startTime: '9:00 AM', endTime: '10:30 AM', createdAt: '2023-03-15'),
  ClassRoutine(id: '2', clas: 'Science', subject: 'Biology', educator: 'Paul Okocha', startTime: '10:45 AM', endTime: '12:15 PM', createdAt: '2022-09-09'),
  ClassRoutine(id: '3', clas: 'English', subject: 'Grammar', educator: 'Jason Osimeh', startTime: '1:00 PM', endTime: '2:30 PM', createdAt: '2023-03-28'),
  ClassRoutine(id: '4', clas: 'Social Studies', subject: 'History', educator: 'Thomas Tuchel', startTime: '2:45 PM', endTime: '4:15 PM', createdAt: '2022-04-04'),
  ClassRoutine(id: '5', clas: 'Data Analysis', subject: 'Data Migration', educator: 'Samuel Nuhu', startTime: '12:45 PM', endTime: '2:15 PM', createdAt: '2023-04-11'),
];


// COURSE
class AccademicCourse extends AppData {
  AccademicCourse({
    required super.id,
    required this.clas,
    required this.course,
  });

  final String clas;
  final String course;
}
// Course objects
List<AccademicCourse> academicCoursesList = [
  AccademicCourse(id: '1', clas: 'Class A', course: 'Mathematics'),
  AccademicCourse(id: '2', clas: 'Class B', course: 'English'),
  AccademicCourse(id: '3', clas: 'Class C', course: 'Science'),
  AccademicCourse(id: '4', clas: 'Class D', course: 'Social Studies'),
  AccademicCourse(id: '5', clas: 'Class E', course: 'History'),
];


// SYLLABUS
class Syllabus extends AppData {
  Syllabus({
    required super.id,
    required this.clas,
    required this.title,
    required this.subject,
    required this.file,
  });

  final String clas;
  final String title;
  final String subject;
  final String file;
}

// Syllabus objects
List<Syllabus> syllabiList = [
  Syllabus(id: '1', clas: 'Class A', title: 'Unit 1', subject: 'Mathematics', file: 'maths_unit1.pdf'),
  Syllabus(id: '2', clas: 'Class B', title: 'Chapter 3', subject: 'English', file: "assets/images/nct-meeting.png",),
  Syllabus(id: '3', clas: 'Class C', title: 'Topic 2', subject: 'Science', file: 'science_topic2.pdf'),
  Syllabus(id: '4', clas: 'Class D', title: 'Unit 4', subject: 'Social Studies', file: "assets/images/nct-meeting.png",),
  Syllabus(id: '5', clas: 'Class E', title: 'Lesson 5', subject: 'History', file: 'history_lesson5.pdf'),
];


// CERTIFICATE
class Certificate extends AppData {
  Certificate({
    required super.id,
    required this.fullName,
    required this.faculty,
    required this.department,
    required this.accessId,
    required this.certificateNo,
    required this.issuesOn,
    required this.file,
  });

  final String fullName;
  final String faculty;
  final String department;
  final String accessId;
  final int    certificateNo;
  final String issuesOn;
  final String file;
}
// Certificate objects
List<Certificate> certificatesList = [
  Certificate(
    id: '1',
    fullName: 'John Doe',
    faculty: 'Faculty of Science',
    department: 'Physics',
    accessId: 'JD-2023',
    certificateNo: 123456,
    issuesOn: '2023-04-11',
    file: 'certificate_johndoe.pdf',
  ),
  Certificate(
    id: '2',
    fullName: 'Jane Smith',
    faculty: 'Faculty of Arts',
    department: 'English',
    accessId: 'JS-2022',
    certificateNo: 654321,
    issuesOn: '2022-06-30',
    file: 'certificate_janesmith.pdf',
  ),
  Certificate(
    id: '3',
    fullName: 'Bob Johnson',
    faculty: 'Faculty of Business',
    department: 'Marketing',
    accessId: 'BJ-2021',
    certificateNo: 789012,
    issuesOn: '2021-10-15',
    file: 'certificate_bobjohnson.pdf',
  ),
  Certificate(
    id: '4',
    fullName: 'Mary Lee',
    faculty: 'Faculty of Engineering',
    department: 'Mechanical Engineering',
    accessId: 'ML-2020',
    certificateNo: 567890,
    issuesOn: '2020-12-25',
    file: 'certificate_marylee.pdf',
  ),
  Certificate(
    id: '5',
    fullName: 'Tom Wilson',
    faculty: 'Faculty of Medicine',
    department: 'Neurology',
    accessId: 'TW-2019',
    certificateNo: 901234,
    issuesOn: '2019-03-01',
    file: 'certificate_tomwilson.pdf',
  ),
];


// FACULTY
class Faculty extends AppData {
  Faculty({
    required super.id,
    required this.faculty,
    required this.hod,
    required this.studentsCount,
  });

  final String faculty;
  final String hod;
  final int studentsCount;
}
// Faculty objects
final List<Faculty> facultiesList = [
  Faculty(
    id: '1',
    faculty: 'Data Science',
    hod: 'John Doe',
    studentsCount: 1200,
  ),
  Faculty(
    id: '2',
    faculty: 'Digital Marketing',
    hod: 'Jane Smith',
    studentsCount: 800,
  ),
  Faculty(
    id: '3',
    faculty: 'Cyber Policy And Governance',
    hod: 'Sarah Johnson',
    studentsCount: 600,
  ),
  Faculty(
    id: '4',
    faculty: 'Ethical Hacking',
    hod: 'David Lee',
    studentsCount: 400,
  ),
  Faculty(
    id: '5',
    faculty: 'Graphical Design',
    hod: 'Mary Brown',
    studentsCount: 1000,
  ),
];


// CLASS
class Class extends AppData {
  Class({
    required super.id,
    required this.name,
    required this.faculty,
    required this.clas,
  });

  final String name;
  final String faculty;
  final String clas;
}
// Class objects
final List<Class> classesList = [
  Class(
    id: '1',
    name: 'Engineering 101',
    faculty: 'Engineering',
    clas: 'E101',
  ),
  Class(
    id: '2',
    name: 'Business 101',
    faculty: 'Business',
    clas: 'B101',
  ),
  Class(
    id: '3',
    name: 'History 101',
    faculty: 'Arts',
    clas: 'H101',
  ),
  Class(
    id: '4',
    name: 'Criminal Law 101',
    faculty: 'Law',
    clas: 'L101',
  ),
  Class(
    id: '5',
    name: 'Biology 101',
    faculty: 'Sciences',
    clas: 'S101',
  ),
];


// FINANCE
class Finance extends AppData {
  Finance({
    required super.id,
    required this.title,
    required this.name,
    // required this.avatar,
    required this.clas,
    required this.status,
    required this.totalAmount,
    required this.paidAmount,
  });

  final String title;
  final String name;
  final String clas;
  final String status;
  final double totalAmount;
  final double paidAmount;
}

// Finance objects
final List<Finance> financeList = [
  Finance(
    id: '1',
    title: 'Tuition fees',
    name: 'John Doe',
    clas: 'E101',
    status: 'Unpaid',
    totalAmount: 5000.0,
    paidAmount: 0.0,
  ),
  Finance(
    id: '2',
    title: 'Library fees',
    name: 'Jane Smith',
    clas: 'B101',
    status: 'Paid',
    totalAmount: 1000.0,
    paidAmount: 1000.0,
  ),
  Finance(
    id: '3',
    title: 'Lab fees',
    name: 'Sarah Johnson',
    clas: 'H101',
    status: 'Unpaid',
    totalAmount: 2500.0,
    paidAmount: 0.0,
  ),
  Finance(
    id: '4',
    title: 'Exam fees',
    name: 'David Lee',
    clas: 'L101',
    status: 'Unpaid',
    totalAmount: 2000.0,
    paidAmount: 0.0,
  ),
  Finance(
    id: '5',
    title: 'Lab equipment fees',
    name: 'Mary Brown',
    clas: 'S101',
    status: 'Paid',
    totalAmount: 500.0,
    paidAmount: 500.0,
  ),
];


// BOOK
class Book extends AppData {
  Book({
    required super.id,
    required this.title,
    required this.availableCopies,
    required this.educator,
    required this.avatar,
  });

  final String title;
  final String availableCopies;
  final String educator;
  final String avatar;
}
// Book objects
List<Book> booksList = [
  Book(
      id: "1",
      title: "The Great Gatsby",
      availableCopies: "5",
      educator: "Ms. Smith",
      avatar: "https://example.com/ms-smith.png"),
  Book(
      id: "2",
      title: "To Kill a Mockingbird",
      availableCopies: "3",
      educator: "Mr. Johnson",
      avatar: "https://example.com/mr-johnson.png"),
  Book(
      id: "3",
      title: "1984",
      availableCopies: "8",
      educator: "Ms. Lee",
      avatar: "https://example.com/ms-lee.png"),
  Book(
      id: "4",
      title: "The Catcher in the Rye",
      availableCopies: "2",
      educator: "Ms. Brown",
      avatar: "https://example.com/ms-brown.png"),
  Book(
      id: "5",
      title: "Animal Farm",
      availableCopies: "6",
      educator: "Mr. Martinez",
      avatar: "https://example.com/mr-martinez.png"),
];


// BOOK ISSUE
class BookIssue extends AppData {
  BookIssue({
    required super.id,
    required this.book,
    required this.educator,
    required this.avatar,
    required this.clas,
    required this.student,
    required this.createdAt,
  });

  final String book;
  final String educator;
  final String avatar;
  final String clas;
  final String student;
  final String createdAt;
}
// BookIssue objects
List<BookIssue> bookIssuesList = [
  BookIssue(
      id: "1",
      book: "The Great Gatsby",
      educator: "Ms. Smith",
      avatar: 'assets/dps/5.jpg',
      clas: "Grade 11",
      student: "John Doe",
      createdAt: "2022-03-15"),
  BookIssue(
      id: "2",
      book: "1984",
      educator: "Ms. Lee",
      avatar: 'assets/dps/4.jpg',
      clas: "Grade 12",
      student: "Jane Doe",
      createdAt: "2022-04-02"),
  BookIssue(
      id: "3",
      book: "Animal Farm",
      educator: "Mr. Martinez",
      avatar: 'assets/dps/2.jpg',
      clas: "Grade 10",
      student: "Bob Smith",
      createdAt: "2022-05-01"),
  BookIssue(
      id: "4",
      book: "To Kill a Mockingbird",
      educator: "Mr. Johnson",
      avatar: 'assets/dps/3.jpg',
      clas: "Grade 11",
      student: "Alice Johnson",
      createdAt: "2022-03-18"),
  BookIssue(
      id: "5",
      book: "The Catcher in the Rye",
      educator: "Ms. Brown",
      avatar: 'assets/dps/1.jpg',
      clas: "Grade 12",
      student: "Robert Lee",
      createdAt: "2022-02-20"),
];


// ENQUIRIES
class Enquiries extends AppData {
  Enquiries({
    required super.id,
    required this.enquiry,
    required this.comments,
    required this.howYouFoundUs,
    required this.createdAt,
  });

  final String enquiry;
  final String comments;
  final String howYouFoundUs;
  final String createdAt;
}
// Enquiries objects
List<Enquiries> enquiriesList = [
  Enquiries(
    id: '1',
    enquiry: 'Admission Enquiry',
    comments: 'I am interested in pursuing a degree in Computer Science',
    howYouFoundUs: 'Friend referral',
    createdAt: '2022-03-21',
  ),
  Enquiries(
    id: '2',
    enquiry: 'Course Enquiry',
    comments: 'I would like more information on the Software Engineering course',
    howYouFoundUs: 'Google Search',
    createdAt: '2022-04-01',
  ),
  Enquiries(
    id: '3',
    enquiry: 'General Enquiry',
    comments: 'Can you provide me with the campus address?',
    howYouFoundUs: 'Brochure',
    createdAt: '2022-02-10',
  ),
  Enquiries(
    id: '4',
    enquiry: 'Financial Aid Enquiry',
    comments: 'I am wondering what financial aid options are available for international students',
    howYouFoundUs: 'School Website',
    createdAt: '2022-03-17',
  ),
  Enquiries(
    id: '5',
    enquiry: 'Career Services Enquiry',
    comments: 'I would like to learn more about the career services provided by the school',
    howYouFoundUs: 'College Fair',
    createdAt: '2022-04-07',
  ),
];

// Event Calender
// - title
// - startDate
// - endDate


// EventCalendar
class EventCalendar extends AppData {
  EventCalendar({
    required super.id,
    required this.title,
    required this.startDate,
    required this.endDate,
  });

  final String title;
  final String startDate;
  final String endDate;
}
// EventCalendar objects
List<EventCalendar> eventList = [
  EventCalendar(
    id: "1",
    title: "Conference",
    startDate: "2023-04-20",
    endDate: "2023-04-22",
  ),
  EventCalendar(
    id: "2",
    title: "Concert",
    startDate: "2023-05-15",
    endDate: "2023-05-16",
  ),
  EventCalendar(
    id: "3",
    title: "Birthday Party",
    startDate: "2023-06-01",
    endDate: "2023-06-01",
  ),
  EventCalendar(
    id: "4",
    title: "Wedding",
    startDate: "2023-07-10",
    endDate: "2023-07-12",
  ),
  EventCalendar(
    id: "5",
    title: "Holiday",
    startDate: "2023-08-20",
    endDate: "2023-08-26",
  ),
];


// Attendance
// - class
// - attendance
// - date
//
//
// Class Routine
// - class
// - subject
// - teacher
// - start_time
// - end_time
// - month_and_day
//
// Courses
// - class
// - course
//
// Syllabus
// - class
// - title
// - subject
// - file(image, file)
//
// Certificate
// - full name
// - faculty
// - department
// - access id
// - certificate No
// - issues On
// - file(image, file)
//
// Faculty
// - faculty
// - hod
// - students_count
//
// Event Calender
// - title
// - startDate
// - endDate
//
// Class
// - name
// - faculty
// - class
//
// Class Work
// - name
// - description
// - course
// - date
// - file(image, file)
//
// Finance
// - invoice_title
// - educator
// - avatar
// - class
// - status
// - total_amount
// - paid_amount
//
// Books
// - book_name
// - available_copies
// - educator
// - avatar
//
// Book Issue
// - book_name
// - educator
// - avatar
// - class
// - student
// - issued
//
// Enquiries
// - purpose
// - comments
// - info
// - how_did_you_find_us
// - date
