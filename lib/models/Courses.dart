import 'package:neocloud_mobile/models/Students.dart';

class Course {
  final String id;
  final String title;
  final String imgSrc;
  final Account user;
  final double rating;
  final double price;
  final int reviews_count;
  final int students_count;
  final int duration;
  final List<Review>? reviews;
  final List<String>? accomplishments;
  final List<String>? requirements;

  const Course({
    required this.id,
    required this.imgSrc,
    required this.title,
    required this.user,
    required this.rating,
    required this.price,
    required this.reviews_count,
    required this.students_count,
    required this.duration,
    this.reviews,
    this.accomplishments,
    this.requirements,
  });
}

class Review {
  final String id;
  final String name;
  final double rating;
  final String content;

  Review({required this.id, required this.name, required this.rating, required this.content});
}

class CourseModule {
  final String id;
  final String title;
  final List<CourseMaterial>? materials;

  CourseModule({
    required this.id,
    required this.title,
    this.materials,
  });
}

class CourseMaterial {
  final String id;
  final String title;
  final String type;
  final String duration;

  CourseMaterial({
    required this.id,
    required this.title,
    required this.type,
    required this.duration,
  });
}

// Items
List<Course> coursesList = [
  Course(
      id: "1",
      imgSrc: "assets/images/course_python.jpg",
      title: "The Ultimate Python Course For Automation Today",
      user: users[0],
      price: 55599,
      rating: 94,
      reviews_count: 22,
      duration: 12,
      students_count: 103,
      accomplishments: [
        "You’ll get a complete knowledge on Python fundamentals  starting from a-z",
        "You’ll be able to implement Python Test Automation Frameworks from scratch with all latest Technologies",
        "You will be learning Python Unit Test Frameworks like PyTest which will be helpful for Unit and Integration Testing",
        "You'll be a certified Tech bro when we are done I am done with u"
      ],
      requirements: [
        "It’s not required to have a prior knowledge on python",
        "Though these are online lectures. You will have Life Time Educator support. You can contact me anytime for your queries",
        "You need to have a system (Windows, Mac or Linux), that’s able to install and run python without any hiccups",
        "It's okay to be a lazy person prior to taking this course, by the time I am done with you, you won't be the same"
      ]),
  Course(
      id: "2",
      imgSrc: "assets/images/course_html&css.jpg",
      title: "The Ultimate HTML & CSS Course Online",
      user: users[1],
      price: 62000,
      rating: 76,
      reviews_count: 59,
      duration: 17,
      students_count: 69,
      accomplishments: [
        "You’ll get a complete knowledge on Python fundamentals  starting from a-z",
        "You’ll be able to implement Python Test Automation Frameworks from scratch with all latest Technologies",
        "You will be learning Python Unit Test Frameworks like PyTest which will be helpful for Unit and Integration Testing",
        "You'll be a certified Tech bro when we are done I am done with u"
      ],
      requirements: [
        "It’s not required to have a prior knowledge on python",
        "Though these are online lectures. You will have Life Time Educator support. You can contact me anytime for your queries",
        "You need to have a system (Windows, Mac or Linux), that’s able to install and run python without any hiccups",
        "It's okay to be a lazy person prior to taking this course, by the time I am done with you, you won't be the same"
      ]),
];

List<CourseModule> modulesList = [
  CourseModule(
    id: '1',
    title: 'Course Orientation',
    materials: [
      CourseMaterial(
        id: '1',
        title: 'Welcome to The Course!',
        type: 'Video',
        duration: '10:30',
      ),
      CourseMaterial(
        id: '2',
        title: 'Joining The Community Chat & ...',
        type: 'Video',
        duration: '3:32',
      ),
      CourseMaterial(
        id: '15',
        title: 'Course Outline Walkthrough',
        type: 'Video',
        duration: '23:06',
      ),
    ],
  ),
  CourseModule(
    id: '2',
    title: 'An Introduction to the world of Automation',
    materials: [
      CourseMaterial(
        id: '14',
        title: 'Comprehensive overview of Python',
        type: 'Video',
        duration: '1:48:44',
      ),
      CourseMaterial(
        id: '16',
        title: 'Getting started with Sellenium',
        type: 'Text',
        duration: 'N/A',
      ),
    ],
  ),
  CourseModule(
    id: '3',
    title: 'Automation Tools',
    materials: [
      CourseMaterial(
        id: '5',
        title: 'Web scraping with BeautifulSoup',
        type: 'Video',
        duration: '34:12',
      ),
      CourseMaterial(
        id: '6',
        title: 'Automating Tasks with PyAutoGUI',
        type: 'Text',
        duration: 'N/A',
      ),
      CourseMaterial(
        id: '10',
        title: 'Automating Excel with openpyxl',
        type: 'Video',
        duration: '28:56',
      ),
    ],
  ),
  CourseModule(
    id: '4',
    title: 'Working with APIs',
    materials: [
      CourseMaterial(
        id: '8',
        title: 'Using Requests to work with APIs',
        type: 'Video',
        duration: '22:05',
      ),
      CourseMaterial(
        id: '9',
        title: 'Working with JSON data in Python',
        type: 'Video',
        duration: '14:18',
      ),
      CourseMaterial(
        id: '11',
        title: 'Automating Twitter with tweepy',
        type: 'Video',
        duration: '19:37',
      ),
      CourseMaterial(
        id: '11',
        title: 'Automating Twitter with tweepy',
        type: 'File',
        duration: '1:00',
      ),
    ],
  ),
  CourseModule(
    id: '5',
    title: 'Final Project',
    materials: [
      CourseMaterial(
        id: '12',
        title: 'Final Project Brief',
        type: 'Text',
        duration: 'N/A',
      ),
      CourseMaterial(
        id: '13',
        title: 'Building the Final Project',
        type: 'Video',
        duration: '2:45:19',
      ),
      CourseMaterial(
        id: '17',
        title: 'Final Project Presentation',
        type: 'Video',
        duration: '18:54',
      ),
    ],
  ),
];

List<Review> reviewsList = [
  Review(
    id: '1',
    name: 'John Doe',
    rating: 85,
    content: 'Great product, would recommend!',
  ),
  Review(
    id: '2',
    name: 'Jane Smith',
    rating: 100,
    content: 'Amazing experience, loved it!',
  ),
  Review(
    id: '3',
    name: 'Bob Johnson',
    rating: 60,
    content: 'Product was okay, not too impressed.',
  ),
  Review(
    id: '4',
    name: 'Alice Williams',
    rating: 75,
    content: 'Good value for the price.',
  ),
  Review(
    id: '5',
    name: 'Tom Wilson',
    rating: 25,
    content: 'Disappointed with the product quality.',
  ),
];