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
