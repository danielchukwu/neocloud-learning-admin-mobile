class Account {
  final int id;
  final String avatar;
  final String fullName;
  final int phone;
  final String email;
  final String password;
  final String role;
  final double ratings;
  final int students_count;
  final int courses_count;
  final int reviews_count;

  const Account({
    required this.id,
    required this.avatar,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.password,
    required this.role,
    required this.ratings,
    required this.students_count,
    required this.courses_count,
    required this.reviews_count,
  });
}

class Student extends Account {
  final String accessId;

  Student({
    required this.accessId,
    required super.avatar,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.role,
    required super.password,
    required super.ratings,
    required super.id,
    required super.students_count,
    required super.courses_count,
    required super.reviews_count,
  });
}

class Educator extends Account {
  final String facutly;
  final String designation;

  Educator({
    required this.facutly,
    required this.designation,
    required super.avatar,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.role,
    required super.password,
    required super.ratings,
    required super.id,
    required super.students_count,
    required super.courses_count,
    required super.reviews_count,
  });
}

class Admin extends Account {
  Admin({
    required super.avatar,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.password,
    required super.role,
    required super.ratings,
    required super.id,
    required super.students_count,
    required super.courses_count,
    required super.reviews_count,
  });
}

// Ratings
//
String imagePath = 'assets/dps/';
List<Account> users = [
  Student(
    avatar: '${imagePath}1.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Nathan Charlie Camacho",
    email: "charllie@yahoo.com",
    phone: 09031440494,
    password: 'abc',
    role: 'Educator',
    ratings: 100,
    id: 1,
    students_count: 16,
    courses_count: 3,
    reviews_count: 12,
  ),
  Student(
    id: 2,
    avatar: '${imagePath}2.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Obi Nwanemm",
    email: "obidient@yahoo.com",
    phone: 09031440494,
    password: 'abc',
    role: 'Student',
    ratings: 80,
    students_count: 11,
    courses_count: 5,
    reviews_count: 23,
  ),
  Student(
    id: 3,
    avatar: '${imagePath}3.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Emmanuel Nwosu",
    email: "nwosu_@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: 'Student',
    ratings: 60,
    students_count: 6,
    courses_count: 7,
    reviews_count: 10,
  ),
  Student(
    id: 4,
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
    role: 'Educator',
    ratings: 40,
    students_count: 12,
    courses_count: 1,
    reviews_count: 5,
  ),
  Student(
    id: 5,
    avatar: '${imagePath}5.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Samuel Nuhu",
    email: "samuel@yahoo.com",
    phone: 09031440494,
    password: 'abc',
    role: 'SuperAdmin',
    ratings: 20,
    students_count: 19,
    courses_count: 5,
    reviews_count: 23,
  ),
];
