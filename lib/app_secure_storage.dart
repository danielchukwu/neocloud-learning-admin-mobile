import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AppSecureStorage {
  static final storage = new FlutterSecureStorage();
  static const _tokenKey = "jwt_token";

  static Future<String?> getToken() async {
    return await storage.read(key: _tokenKey);
  }

  static Future setToken(String jwtToken) async {
    // var jwtRegEx = RegExp(r'^[^.]+\.[^.]+\.[^.]+$');
    var jwtRegEx = RegExp(r'^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+$');
    debugPrint('setToken(***) called!');
    if (jwtRegEx.hasMatch(jwtToken)) {
      debugPrint('jwtRegEx passes ✅');
      await storage.write(key: _tokenKey, value: jwtToken);
    } else {
      debugPrint("jwtRegEx did'nt pass ❌");
      await storage.write(key: _tokenKey, value: 'token is missing');
    }
  }

  static Future deleteToken() async {
    await storage.delete(key: _tokenKey);
  }
}