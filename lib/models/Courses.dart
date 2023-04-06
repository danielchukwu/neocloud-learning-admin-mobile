import 'package:neocloud_mobile/models/students.dart';

class Course {
  final String imgSrc;
  final String title;
  final Account user;
  final double rating;
  final double price;

  const Course({
    required this.imgSrc,
    required this.title,
    required this.user,
    required this.rating,
    required this.price,
  });
}

List<Course> courses = [
  Course(imgSrc: "assets/images/course_python.jpg", title: "The Ultimate Python Course For Automation Today", user: users[0], rating: 4.7, price: 55599),
  Course(imgSrc: "assets/images/course_html&css.jpg", title: "The Ultimate HTML & CSS Course Online", user: users[1], rating: 3.8, price: 62000),
];