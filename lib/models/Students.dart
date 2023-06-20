import 'package:neocloud_mobile/models/Faculty.dart';
import 'package:neocloud_mobile/models/ClassWork.dart';

class Account {
  final int id;
  final String avatar;
  final String accessId;
  final String fullName;
  final int phone;
  final String email;
  final String password;
  final List<String> role;
  final double ratings;
  final String about;
  final Faculty? hod;
  final int students_count;
  final int courses_count;
  final int reviews_count;

  const Account({
    required this.id,
    required this.avatar,
    required this.accessId,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.role,
    required this.ratings,
    required this.about,
    required this.hod,
    required this.students_count,
    required this.courses_count,
    required this.reviews_count,
  });
}

// class Student extends Account {
//   final String accessId;

//   Account({
//     required this.accessId,
//     required super.avatar,
//     required super.fullName,
//     required super.email,
//     required super.phone,
//     required super.role,
//     required super.password,
//     required super.ratings,
//     required super.id,
//     required super.students_count,
//     required super.courses_count,
//     required super.reviews_count, required super.about,
//   });
// }

// class Educator extends Account {
//   final String facutly;
//   final String designation;

//   Educator({
//     required this.facutly,
//     required this.designation,
//     required super.avatar,
//     required super.fullName,
//     required super.email,
//     required super.phone,
//     required super.role,
//     required super.password,
//     required super.ratings,
//     required super.id,
//     required super.students_count,
//     required super.courses_count,
//     required super.reviews_count, required super.about,
//   });
// }

// class Admin extends Account {
//   Admin({
//     required super.avatar,
//     required super.fullName,
//     required super.email,
//     required super.phone,
//     required super.password,
//     required super.role,
//     required super.ratings,
//     required super.id,
//     required super.students_count,
//     required super.courses_count,
//     required super.reviews_count, required super.about,
//   });
// }

var about =
    "Hi! I’m Nathan. I’m a developer with a deep passion for teaching. I’ve spent the last few years teaching people to program at 2 different immersive boot camps. I’ve helped over a million amazing personnel's make their developer dreams a reality, taking them out of poverty over night. This is what I do, If you are looking to be a great developer and make millions while you are at it, purchase anyone of the list of courses I currently have available and start the Journey that will change your life. I assure you";

String imagePath = 'assets/dps/';
List<Account> users = [
  Account(
    avatar: '${imagePath}1.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Nathan Charlie Camacho",
    email: "charllie@yahoo.com",
    phone: 09031440494,
    password: 'abc',
    // role: ['Admin', 'Educator'],
    role: ['Educator'],
    ratings: 100,
    about: about,
    id: 1,
    students_count: 16,
    courses_count: 3,
    reviews_count: 12,
    hod: null,
  ),
  Account(
    id: 2,
    avatar: '${imagePath}2.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Obi Nwanemm",
    email: "obidient@yahoo.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Student'],
    ratings: 80,
    about: about,
    students_count: 11,
    courses_count: 5,
    reviews_count: 23,
    hod: null,
  ),
  Account(
    id: 3,
    avatar: '${imagePath}3.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Emmanuel Nwosu",
    email: "nwosu_@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Student'],
    ratings: 60,
    about: about,
    students_count: 6,
    courses_count: 7,
    reviews_count: 10,
    hod: null,
  ),
  Account(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Educator'],
    ratings: 40,
    about: about,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
    hod: null,
  ),
  Account(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Educator'],
    ratings: 40,
    about: about,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
    hod: null,
  ),
  Account(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Educator'],
    ratings: 40,
    about: about,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
    hod: null,
  ),
  Account(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Educator'],
    ratings: 40,
    about: about,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
    hod: null,
  ),
  Account(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Educator'],
    ratings: 40,
    about: about,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
    hod: null,
  ),
  Account(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: ['Educator'],
    ratings: 40,
    about: about,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
    hod: null,
  ),
  Account(
    id: 5,
    avatar: '${imagePath}5.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Samuel Nuhu",
    email: "samuel@yahoo.com",
    phone: 09031440494,
    password: 'abc',
    role: ['SuperAdmin', 'Admin', 'Educator', 'Student'],
    ratings: 20,
    about: about,
    students_count: 19,
    courses_count: 5,
    reviews_count: 23,
    hod: null,
  ),
];
