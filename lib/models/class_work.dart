// CLASS WORK
class ClassWork {
  ClassWork({
    required this.id,
    required this.title,
    required this.description,
    required this.course,
    required this.file,
    required this.date,
  });

  final String id;
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
class Attendance {
  Attendance({
    required this.id,
    required this.clas,
    required this.attendance,
    required this.createdAt,
  });

  final String id;
  final String clas;
  final int attendance;
  final String createdAt;
}
// Attendance objects
List<Attendance> attendanceList = [
  Attendance(id: '1', clas: 'Maths', attendance: 90, createdAt: '2022-04-11'),
  Attendance(id: '2', clas: 'Science', attendance: 80, createdAt: '2022-04-10'),
  Attendance(id: '3', clas: 'English', attendance: 95, createdAt: '2022-04-09'),
  Attendance(id: '4', clas: 'Social Studies', attendance: 85, createdAt: '2022-04-08'),
  Attendance(id: '5', clas: 'History', attendance: 75, createdAt: '2022-04-07'),
];


// CLASS ROUTINE
class ClassRoutine {
  ClassRoutine({
    required this.id,
    required this.clas,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.createdAt,
  });

  final String id;
  final String clas;
  final String subject;
  final String startTime;
  final String endTime;
  final String createdAt;
}
// Class routine objects
List<ClassRoutine> classRoutineList = [
  ClassRoutine(id: '1', clas: 'Maths', subject: 'Algebra', startTime: '9:00 AM', endTime: '10:30 AM', createdAt: '2023-03-15'),
  ClassRoutine(id: '2', clas: 'Science', subject: 'Biology', startTime: '10:45 AM', endTime: '12:15 PM', createdAt: '2022-09-09'),
  ClassRoutine(id: '3', clas: 'English', subject: 'Grammar', startTime: '1:00 PM', endTime: '2:30 PM', createdAt: '2023-03-28'),
  ClassRoutine(id: '4', clas: 'Social Studies', subject: 'History', startTime: '2:45 PM', endTime: '4:15 PM', createdAt: '2022-04-04'),
  ClassRoutine(id: '4', clas: 'Social Studies', subject: 'History', startTime: '12:45 PM', endTime: '2:15 PM', createdAt: '2023-04-11'),
];


// COURSE
class Course {
  Course({
    required this.id,
    required this.clas,
    required this.course,
  });

  final String id;
  final String clas;
  final String course;
}
// Course objects
List<Course> coursesList = [
  Course(id: '1', clas: 'Class A', course: 'Mathematics'),
  Course(id: '2', clas: 'Class B', course: 'English'),
  Course(id: '3', clas: 'Class C', course: 'Science'),
  Course(id: '4', clas: 'Class D', course: 'Social Studies'),
  Course(id: '5', clas: 'Class E', course: 'History'),
];


// SYLLABUS
class Syllabus {
  Syllabus({
    required this.id,
    required this.clas,
    required this.title,
    required this.subject,
    required this.file,
  });
  final String id;
  final String clas;
  final String title;
  final String subject;
  final String file;
}

// Syllabus objects
List<Syllabus> syllabiList = [
  Syllabus(id: '1', clas: 'Class A', title: 'Unit 1', subject: 'Mathematics', file: 'maths_unit1.pdf'),
  Syllabus(id: '2', clas: 'Class B', title: 'Chapter 3', subject: 'English', file: 'english_chapter3.pdf'),
  Syllabus(id: '3', clas: 'Class C', title: 'Topic 2', subject: 'Science', file: 'science_topic2.pdf'),
  Syllabus(id: '4', clas: 'Class D', title: 'Unit 4', subject: 'Social Studies', file: 'social_studies_unit4.pdf'),
  Syllabus(id: '5', clas: 'Class E', title: 'Lesson 5', subject: 'History', file: 'history_lesson5.pdf'),
];


// CERTIFICATE
class Certificate {
  Certificate({
    required this.id,
    required this.fullName,
    required this.faculty,
    required this.department,
    required this.accessId,
    required this.certificateNo,
    required this.issuesOn,
    required this.file,
});
  final String id;
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
class Faculty {
  Faculty({
    required this.id,
    required this.faculty,
    required this.hod,
    required this.studentsCount,
  });
  final String id;
  final String faculty;
  final String hod;
  final int studentsCount;
}
// Faculty objects
final List<Faculty> faculties = [
  Faculty(
    id: '1',
    faculty: 'Engineering',
    hod: 'John Doe',
    studentsCount: 1200,
  ),
  Faculty(
    id: '2',
    faculty: 'Business',
    hod: 'Jane Smith',
    studentsCount: 800,
  ),
  Faculty(
    id: '3',
    faculty: 'Arts',
    hod: 'Sarah Johnson',
    studentsCount: 600,
  ),
  Faculty(
    id: '4',
    faculty: 'Law',
    hod: 'David Lee',
    studentsCount: 400,
  ),
  Faculty(
    id: '5',
    faculty: 'Sciences',
    hod: 'Mary Brown',
    studentsCount: 1000,
  ),
];


// CLASS
class Class {
  Class({
    required this.id,
    required this.name,
    required this.faculty,
    required this.clas,
  });
  final String id;
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
class Finance {
  Finance({
    required this.id,
    required this.invoiceTitle,
    required this.educator,
    required this.avatar,
    required this.clas,
    required this.status,
    required this.totalAmount,
    required this.paidAmount,
  });

  final String id;
  final String invoiceTitle;
  final String educator;
  final String avatar;
  final String clas;
  final String status;
  final double totalAmount;
  final double paidAmount;
}
// Finance objects
final List<Finance> finances = [
  Finance(
    id: '1',
    invoiceTitle: 'Tuition fees',
    educator: 'John Doe',
    avatar: 'https://example.com/johndoe.jpg',
    clas: 'E101',
    status: 'Unpaid',
    totalAmount: 5000.0,
    paidAmount: 0.0,
  ),
  Finance(
    id: '2',
    invoiceTitle: 'Library fees',
    educator: 'Jane Smith',
    avatar: 'https://example.com/janesmith.jpg',
    clas: 'B101',
    status: 'Paid',
    totalAmount: 1000.0,
    paidAmount: 1000.0,
  ),
  Finance(
    id: '3',
    invoiceTitle: 'Lab fees',
    educator: 'Sarah Johnson',
    avatar: 'https://example.com/sarahjohnson.jpg',
    clas: 'H101',
    status: 'Unpaid',
    totalAmount: 2500.0,
    paidAmount: 0.0,
  ),
  Finance(
    id: '4',
    invoiceTitle: 'Exam fees',
    educator: 'David Lee',
    avatar: 'https://example.com/davidlee.jpg',
    clas: 'L101',
    status: 'Unpaid',
    totalAmount: 2000.0,
    paidAmount: 0.0,
  ),
  Finance(
    id: '5',
    invoiceTitle: 'Lab equipment fees',
    educator: 'Mary Brown',
    avatar: 'https://example.com/marybrown.jpg',
    clas: 'S101',
    status: 'Paid',
    totalAmount: 500.0,
    paidAmount: 500.0,
  ),
];


// BOOK
class Book {
  Book({
    required this.id,
    required this.title,
    required this.availableCopies,
    required this.educator,
    required this.avatar,
  });
  final String id;
  final String title;
  final String availableCopies;
  final String educator;
  final String avatar;
}
// Book objects
List<Book> books = [
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
class BookIssue {
  BookIssue({
    required this.id,
    required this.book,
    required this.educator,
    required this.avatar,
    required this.clas,
    required this.student,
    required this.createdAt,
  });
  final String id;
  final String book;
  final String educator;
  final String avatar;
  final String clas;
  final String student;
  final String createdAt;
}
// BookIssue objects
List<BookIssue> bookIssues = [
  BookIssue(
      id: "1",
      book: "The Great Gatsby",
      educator: "Ms. Smith",
      avatar: "https://example.com/ms-smith.png",
      clas: "Grade 11",
      student: "John Doe",
      createdAt: "2022-03-15"),
  BookIssue(
      id: "2",
      book: "1984",
      educator: "Ms. Lee",
      avatar: "https://example.com/ms-lee.png",
      clas: "Grade 12",
      student: "Jane Doe",
      createdAt: "2022-04-02"),
  BookIssue(
      id: "3",
      book: "Animal Farm",
      educator: "Mr. Martinez",
      avatar: "https://example.com/mr-martinez.png",
      clas: "Grade 10",
      student: "Bob Smith",
      createdAt: "2022-05-01"),
  BookIssue(
      id: "4",
      book: "To Kill a Mockingbird",
      educator: "Mr. Johnson",
      avatar: "https://example.com/mr-johnson.png",
      clas: "Grade 11",
      student: "Alice Johnson",
      createdAt: "2022-03-18"),
  BookIssue(
      id: "5",
      book: "The Catcher in the Rye",
      educator: "Ms. Brown",
      avatar: "https://example.com/ms-brown.png",
      clas: "Grade 12",
      student: "Robert Lee",
      createdAt: "2022-02-20"),
];


// ENQUIRIES
class Enquiries {
  Enquiries({
    required this.id,
    required this.purpose,
    required this.comments,
    required this.info,
    required this.howYouFoundUs,
    required this.createdAt,
  });
  final String id;
  final String purpose;
  final String comments;
  final String info;
  final String howYouFoundUs;
  final String createdAt;
}
// Enquiries objects
List<Enquiries> enquiriesList = [
  Enquiries(
    id: '1',
    purpose: 'Admission Enquiry',
    comments: 'I am interested in pursuing a degree in Computer Science',
    info: 'John Doe',
    howYouFoundUs: 'Friend referral',
    createdAt: '2022-03-21',
  ),
  Enquiries(
    id: '2',
    purpose: 'Course Enquiry',
    comments: 'I would like more information on the Software Engineering course',
    info: 'Jane Smith',
    howYouFoundUs: 'Google Search',
    createdAt: '2022-04-01',
  ),
  Enquiries(
    id: '3',
    purpose: 'General Enquiry',
    comments: 'Can you provide me with the campus address?',
    info: 'Bob Johnson',
    howYouFoundUs: 'Brochure',
    createdAt: '2022-02-10',
  ),
  Enquiries(
    id: '4',
    purpose: 'Financial Aid Enquiry',
    comments: 'I am wondering what financial aid options are available for international students',
    info: 'Sarah Lee',
    howYouFoundUs: 'School Website',
    createdAt: '2022-03-17',
  ),
  Enquiries(
    id: '5',
    purpose: 'Career Services Enquiry',
    comments: 'I would like to learn more about the career services provided by the school',
    info: 'David Kim',
    howYouFoundUs: 'College Fair',
    createdAt: '2022-04-07',
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
