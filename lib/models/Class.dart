import 'Faculty.dart';
import 'Students.dart';

class Class {
  final String id;
  final String title;
  final String avatar;
  final String about;
  final double rating;
  final Account educator;
  final Account hod;
  final Faculty faculty;

  Class({
    required this.id,
    required this.title,
    required this.avatar,
    required this.about,
    required this.rating,
    required this.hod,
    required this.educator,
    required this.faculty,
  });
}

String about =
    "In this comprehensive programming class, we will cover a wide range of programming languages, tools, and concepts that are essential in today's technology-driven world. Whether you are a beginner looking to kickstart your programming journey or an experienced developer aiming to expand your skill set, our class is tailored to meet your needs.";

// Items
List<Class> classesList = [
  Class(
    id: "1",
    avatar: "assets/images/course_python.jpg",
    title: "The Ultimate Python Course For Automation Today",
    about: about,
    rating: 63,
    educator: users[0],
    faculty: facultiesList[4],
    hod: users[4],
  ),
  Class(
    id: "2",
    avatar: "assets/images/course_html&css.jpg",
    title: "The Ultimate HTML & CSS Course Online",
    about: about,
    rating: 15,
    educator: users[2],
    faculty: facultiesList[2],
    hod: users[3],
  ),
  Class(
    id: "3",
    avatar: "assets/images/course_javascript.jpg",
    title: "The Comprehensive JavaScript Course: Build Real-World Projects",
    about: about,
    rating: 88,
    educator: users[1],
    faculty: facultiesList[3],
    hod: users[2],
  ),
  Class(
    id: "4",
    avatar: "assets/images/course_react.jpg",
    title: "Mastering React: Build Dynamic Web Applications",
    about: about,
    rating: 67,
    educator: users[3],
    faculty: facultiesList[0],
    hod: users[1],
  ),
  Class(
    id: "5",
    avatar: "assets/images/course_java.jpg",
    title: "Java Programming for Beginners: Learn Java from Scratch",
    about: about,
    rating: 35,
    educator: users[4],
    faculty: facultiesList[0],
    hod: users[0],
  ),
  Class(
    id: "6",
    avatar: "assets/images/course_aws.jpg",
    title: "AWS Certified Solutions Architect: Associate Certification",
    about: about,
    rating: 50,
    educator: users[1],
    faculty: facultiesList[0],
    hod: users[0],
  ),
];

// Class Modules and Class Module Items

class ClassModule {
  final String id;
  final String title;
  final List<ClassModuleItem>? materials;

  ClassModule({
    required this.id,
    required this.title,
    this.materials,
  });
}

class ClassModuleItem {
  final String id;
  final String title;
  final String description;
  final String date;
  final String duration;

  ClassModuleItem({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.duration,
  });
}

// ITEMS
List<ClassModule> modulesList = [
  ClassModule(
    id: '1',
    title: 'Course Orientation',
    materials: [
      ClassModuleItem(
        id: '1',
        title: 'Welcome to The Course!',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '10:30 - 12:00',
      ),
      ClassModuleItem(
        id: '2',
        title: 'Joining The Community Chat & ...',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '3:32 - 5:10',
      ),
      ClassModuleItem(
        id: '15',
        title: 'Course Outline Walkthrough',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
    ],
  ),
  ClassModule(
    id: '2',
    title: 'An Introduction to the world of Automation',
    materials: [
      ClassModuleItem(
        id: '14',
        title: 'Comprehensive overview of Python',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '16',
        title: 'Getting started with Sellenium',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
    ],
  ),
  ClassModule(
    id: '3',
    title: 'Automation Tools',
    materials: [
      ClassModuleItem(
        id: '5',
        title: 'Web scraping with BeautifulSoup',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '6',
        title: 'Automating Tasks with PyAutoGUI',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '10',
        title: 'Automating Excel with openpyxl',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
    ],
  ),
  ClassModule(
    id: '4',
    title: 'Working with APIs',
    materials: [
      ClassModuleItem(
        id: '8',
        title: 'Using Requests to work with APIs',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '9',
        title: 'Working with JSON data in Python',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '11',
        title: 'Automating Twitter with tweepy',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '11',
        title: 'Automating Twitter with tweepy',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
    ],
  ),
  ClassModule(
    id: '5',
    title: 'Final Project',
    materials: [
      ClassModuleItem(
        id: '12',
        title: 'Final Project Brief',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '13',
        title: 'Building the Final Project',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
      ClassModuleItem(
        id: '17',
        title: 'Final Project Presentation',
        description:
            'We will learn how to communicate in a way that guarantees our success taking this course.',
        date: 'Mon',
        duration: '12:00 - 2:20',
      ),
    ],
  ),
];
