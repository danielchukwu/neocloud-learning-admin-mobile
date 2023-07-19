// : (){} "" <> ? _ ! *
class UserModel {
  final String id;
  final String name;
  final String? email;
  final String? cover;
  final String? avatar;
  final String? password;
  final String? bio;
  final String? phone;
  final int? rating;
  // hod: User!

  UserModel({
    required this.id,
    required this.name,
    this.email,
    this.cover,
    this.avatar,
    this.password,
    this.bio,
    this.phone,
    this.rating
  });

  static UserModel fromMap({required Map user}) => UserModel(
    id: user['_id'],
    name: user['name'],
    email: user['email'],
    cover: user['cover'],
    avatar: user['avatar'],
    password: user['password'],
    bio: user['bio'],
    phone: user['phone'],
    rating: user['rating'],
  );
}