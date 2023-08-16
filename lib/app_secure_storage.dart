import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';

class AppSecureStorage {
  static final _storage = new FlutterSecureStorage();
  static const _tokenKey = "access_token";
  static const _refreshTokenKey = "refresh_token";
  static String tokenPattern = r'^[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+\.[A-Za-z0-9-_=]+$';

  static Future<String> getToken() async {
    String? token =  await _storage.read(key: _tokenKey);
    return token ?? '';
  }
  static Future<String> getRefreshToken() async {
    String? refreshToken =  await _storage.read(key: _refreshTokenKey);
    return refreshToken ?? '';
  }

  static Future<bool> tokenExists() async {
    String? token = await getToken();
    return isValidToken(token);
  }

  static Future setToken(String jwtToken) async {
    if (isValidToken(jwtToken)) {
      debugPrint('jwtRegEx passes ✅');
      await _storage.write(key: _tokenKey, value: jwtToken);
    } else {
      debugPrint('jwtRegEx deleted 🚮');
      deleteToken();
    }
  }
  static Future setRefreshToken(String refreshToken) async {
    if (isValidToken(refreshToken)) {
      debugPrint('jwtRegEx passes ✅');
      await _storage.write(key: _refreshTokenKey, value: refreshToken);
    } else {
      debugPrint('jwtRegEx deleted 🚮');
      deleteToken();
    }
  }

  static bool isValidToken(String token) {
    var jwtRegEx = RegExp(tokenPattern);
    return jwtRegEx.hasMatch(token);
  }

  static Future deleteToken() async {
    await _storage.delete(key: _tokenKey);
  }
  static Future deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }
}