class ClassWork {
  ClassWork({
    required this.title,
    required this.description,
    required this.course,
    required this.file,
    required this.created_at,
  });

  final String title;
  final String description;
  final String course;
  final String file;
  final String created_at;
}

class Attendance {
  Attendance({
    required this.clas,
    required this.attendance,
    required this.created_at,
  });

  final String clas;
  final int attendance;
  final List<String> created_at;
}

class ClassRoutine {
  ClassRoutine({
    required this.clas,
    required this.subject,
    required this.startTime,
    required this.endTime,
    required this.created_at,
  });

  final String clas;
  final String subject;
  final String startTime;
  final String endTime;
  final String created_at;
}

class Course {
  Course({
    required this.clas,
    required this.course,
  });

  final String clas;
  final String course;
}

// Class Works
List<ClassWork> classWorksData = [
  ClassWork(
    title: "Build an Ecommerce Platform",
    description:
        "In 1 month build out a full fledged Ecommerce application using the below technologies: Flutter, Firebase",
    course: "Cyber Policy and Government",
    file: "assets/images/nct-meeting.png",
    created_at: "May 3",
  ),
  ClassWork(
    title: "Build an Ecommerce Platform",
    description:
        "In 1 month build out a full fledged Ecommerce application using the below technologies: Flutter, Firebase",
    course: "Cyber Policy and Government",
    file: "assets/files/nct-meeting.pdf",
    created_at: "Jan 25",
  )
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
// - educator
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
