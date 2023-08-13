import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

class UserProvider extends ChangeNotifier {
  UserModel _user = UserModel(id: '', name: '');

  set user(UserModel user) {
    _user = user;

    notifyListeners();
  }

  UserModel get user => _user;

  bool userExists() => _user.name.isNotEmpty;

  removeUser() => _user = UserModel(id: '', name: '');
}