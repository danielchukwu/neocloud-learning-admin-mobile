import 'package:flutter/material.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

class UserProvider extends ChangeNotifier {
  UserModel? _user;

  void setUser(UserModel user) {
    _user = user;
    print('NotifyListeners: user');
    notifyListeners();
  }

  UserModel? get user => _user;

  bool userExists() => _user != null;

  removeUser() {
    _user = null;
    notifyListeners();
  }
}