import 'package:neocloud_mobile/models/Students.dart';

class Course {
  final String id;
  final String imgSrc;
  final String title;
  final Account user;
  final double rating;
  final double price;
  final int reviews_count;
  final int students_count;
  final int duration;

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
  });
}

List<Course> coursesList = [
  Course(id: "1", imgSrc: "assets/images/course_python.jpg", title: "The Ultimate Python Course For Automation Today", user: users[0], price: 55599, rating: 94, reviews_count: 22, duration: 12, students_count: 103),
  Course(id: "2", imgSrc: "assets/images/course_html&css.jpg", title: "The Ultimate HTML & CSS Course Online", user: users[1], price: 62000, rating: 76, reviews_count: 59, duration: 17, students_count: 69),
];