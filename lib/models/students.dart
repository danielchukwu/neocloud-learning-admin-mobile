class Account {
  final String fullName;
  final String email;
  final int phone;
  final String avatar;
  final String password;

  const Account({
    required this.avatar,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.password,
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
    required super.password,
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
    required super.password,
  });
}

class Admin extends Account {
  Admin({
    required super.avatar,
    required super.fullName,
    required super.email,
    required super.phone,
    required super.password,
  });
}

String imagePath = 'assets/dps/';
  List<Account> users = [
  Student(
    avatar: '${imagePath}1.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Nathan Charlie Camacho",
    email: "charllie@yahoo.com",
    phone: 09031440494,
    password: 'abc',
  ),
  Student(
    avatar: '${imagePath}2.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Obi Nwanemm",
    email: "obidient@yahoo.com",
    phone: 09031440494,
    password: 'abc',
  ),
  Student(
    avatar: '${imagePath}3.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Emmanuel Nwosu",
    email: "nwosu_@gmail.com",
    phone: 09031440494,
    password: 'abc',
  ),
  Student(
    avatar: '${imagePath}4.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Sunday Habbakuk",
    email: "sunday22@gmail.com",
    phone: 09031440494,
    password: 'abc',
  ),
  Student(
    avatar: '${imagePath}5.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Samuel Nuhu",
    email: "samuel@yahoo.com",
    phone: 09031440494,
    password: 'abc',
  ),
  Student(
    avatar: '${imagePath}5.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Samuel Nuhu",
    email: "samuel@yahoo.com",
    phone: 09031440494,
    password: 'abc',
  ),
  Student(
    avatar: '${imagePath}5.jpg',
    accessId: "NCT/SP/23/0042",
    fullName: "Samuel Nuhu",
    email: "samuel@yahoo.com",
    phone: 09031440494,
    password: 'abc',
  ),
];
