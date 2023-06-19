import 'package:neocloud_mobile/models/Students.dart';

// CLASSES
class Course {
  final String id;
  final String title;
  final String avatar;
  final Account user;
  final double rating;
  final double price;
  final int? discount;
  final int? reviews_count;
  final int? students_count;
  final int? duration;
  final List<Review>? reviews;
  final List<String>? accomplishments;
  final List<String>? requirements;

  const Course({
    required this.id,
    required this.avatar,
    required this.title,
    required this.user,
    required this.rating,
    required this.price,
    required this.discount,
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

  Review(
      {required this.id,
      required this.name,
      required this.rating,
      required this.content});
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

// ITEMS
List<Course> coursesList = [
  Course(
    id: "1",
    avatar: "assets/images/course_python.jpg",
    title: "The Ultimate Python Course For Automation Today",
    user: users[0],
    price: 55599,
    discount: 20,
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
    ],
  ),
  Course(
    id: "2",
    avatar: "assets/images/course_html&css.jpg",
    title: "The Ultimate HTML & CSS Course Online",
    user: users[1],
    price: 62000,
    discount: 45,
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
    ],
  ),
  Course(
    id: "3",
    avatar: "assets/images/course_javascript.jpg",
    title: "The Comprehensive JavaScript Course: Build Real-World Projects",
    user: users[2],
    price: 99999,
    discount: 10,
    rating: 85,
    reviews_count: 42,
    duration: 20,
    students_count: 87,
    accomplishments: [
      "You will learn the JavaScript language and how to use it in web development",
      "You will build real-world projects that you can add to your portfolio",
      "You will gain a thorough understanding of JavaScript's fundamentals",
      "You'll be a skilled JavaScript developer by the end of this course"
    ],
    requirements: [
      "Basic understanding of HTML and CSS",
      "Access to a computer with internet connection",
      "No prior JavaScript experience is necessary"
    ],
  ),
  Course(
    id: "4",
    avatar: "assets/images/course_react.jpg",
    title: "Mastering React: Build Dynamic Web Applications",
    user: users[3],
    price: 79999,
    discount: 30,
    rating: 91,
    reviews_count: 63,
    duration: 15,
    students_count: 105,
    accomplishments: [
      "You will learn React fundamentals and how to build dynamic web applications",
      "You will gain hands-on experience building projects with React",
      "You will learn how to integrate React with other technologies such as Firebase and Redux",
      "You'll be a skilled React developer by the end of this course"
    ],
    requirements: [
      "Basic understanding of HTML, CSS, and JavaScript",
      "Access to a computer with internet connection",
      "No prior React experience is necessary"
    ],
  ),
  Course(
    id: "5",
    avatar: "assets/images/course_java.jpg",
    title: "Java Programming for Beginners: Learn Java from Scratch",
    user: users[4],
    price: 49999,
    discount: 50,
    rating: 80,
    reviews_count: 31,
    duration: 10,
    students_count: 93,
    accomplishments: [
      "You will learn Java fundamentals and how to write Java code",
      "You will gain hands-on experience building Java applications",
      "You will learn about object-oriented programming concepts",
      "You'll be a skilled Java developer by the end of this course"
    ],
    requirements: [
      "Access to a computer with internet connection",
      "No prior programming experience is necessary"
    ],
  ),
  Course(
    id: "6",
    avatar: "assets/images/course_aws.jpg",
    title: "AWS Certified Solutions Architect: Associate Certification",
    user: users[2],
    price: 119999,
    discount: 25,
    rating: 88,
    reviews_count: 50,
    duration: 30,
    students_count: 75,
    accomplishments: [
      "You will learn about AWS services and solutions",
      "You will be prepared for the AWS Certified Solutions Architect: Associate certification exam",
      "You will gain hands-on experience with AWS tools and services",
      "You'll be a certified AWS Solutions Architect by the end of this course"
    ],
    requirements: [
      "Basic understanding of cloud computing concepts",
      "Access to a computer with internet connection",
      "No prior AWS experience is necessary"
    ],
  )
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
    name: 'Emefor Chinonso',
    rating: 85,
    content:
        'As a computer Science graduate, I found this NCT course taught by Nathan to be extremely efficient in transitioning to an automation career. I would recommend Nathan Rashford to anyone who seriously wants to dive into any tech career. 5+ stars for this course!',
  ),
  Review(
    id: '2',
    name: 'Jason Lauthong',
    rating: 100,
    content:
        'Amazing experience, loved it! It even had a little Wordpress in it. This course is a master piece, I would recommend it to any and everyone.',
  ),
  Review(
    id: '3',
    name: 'Ezra Odugbe',
    rating: 60,
    content:
        'Fantastic course, absolutely worth the price! It will teach you all of the fundamental building blocks to automation.\n\n I absolutely recommend this to anyone looking to get started with python automation or even to anyone who kinda has gaps in their knowledge and are looking for a credible source. Look know more sir/ma, this NCT Educator has go it',
  ),
  Review(
    id: '4',
    name: 'Alex Iwobi',
    rating: 75,
    content:
        "I was a bit skeptical before embarking on the journey to take this course but after taking it for some reason I can't even remember, It was well worth it. Good value for the price.",
  ),
  Review(
    id: '5',
    name: 'Mmesoma Chi',
    rating: 25,
    content: 'Disappointed with the course quality.',
  ),
];
