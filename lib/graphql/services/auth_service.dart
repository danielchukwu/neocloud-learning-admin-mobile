import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/providers/UserProvider.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class AuthService {
  static var config = GraphQLConfig();
  var client = config.client;
  var userProvider = UserProvider();  // help store user data after login or signup

  Future<UserModel?> login({required String email, required String password}) async {
    debugPrint('Function called: login(context, email, password) ✍️');
    // this is done so that we don't send a token to a login endpoint, that would make no sense
    AppSecureStorage.deleteToken();
    String loginMutation = """
      mutation Login(\$email: String, \$password: String) {
        login(email: \$email, password: \$password){
          access_token
          refresh_token
          user {
            _id
            name
            email
            phone
            avatar
            bio
            cover
            role {
              _id
              name
            }
          }
        }
      }
    """;

    try {
      var result = await client.value.mutate(MutationOptions(
        document: gql(loginMutation),
        variables: {"email": email, "password": password},
      ));

      if (result.hasException) {
        debugPrint("Login Status: ❌❌");
        await handleErrors(result);
      } else {
        debugPrint("Login Status: ✅");
        String accessToken = await _setAccessAndRefreshTokens('login', result);
        var user = UserModel.fromMap(user: result.data?['login']['user']);
        return user;
      }
    } catch (e) {
      debugPrint("Login Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
    }
  }

  Future<UserModel?> signup(BuildContext context, {required String name, required String phone, required String email, required String password}) async {
    debugPrint('Function called: signup(context, email, password, ...) 🗽');
    // this is done so that we don't send a token to a login endpoint, that would make no sense
    AppSecureStorage.deleteToken();
    String signupMutation = """
      mutation Signup(\$name: String, \$email: String, \$phone: String, \$password: String) {
        signup(name: \$name, email: \$email, phone: \$phone, password: \$password) {
          access_token
          refresh_token
          user {
            _id
            name
            email
            phone
            avatar
            bio
            cover
            role {
              _id
              name
            }
          }
        }
      }
    """;

    try {
      var result = await client.value.mutate(MutationOptions(
        document: gql(signupMutation),
        variables: { "name": name.toLowerCase(), "email": email, "phone": phone, "password": password},
      ));

      if (result.hasException) {
        debugPrint("Signup Status: ❌❌");
        await handleErrors(result);
      } else {
        debugPrint("Signup Status: ✅");
        String accessToken = await _setAccessAndRefreshTokens('signup', result);
        var user = UserModel.fromMap(user: result.data?['login']['user']);
        return user;
      }
    } catch (e) {
      debugPrint("Signup Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
    }
  }

  Future<UserModel?> refreshToken() async {
    debugPrint('Function Called: refreshToken(BuildContext context) 🔃');
    // this is done so that we don't send a token to a login endpoint, that would make no sense
    AppSecureStorage.deleteToken();
    String signupMutation = """
      mutation RefreshToken(\$refreshToken: String) {
        refreshToken(refreshToken: \$refreshToken) {
          access_token
          refresh_token
          user {
            _id
            name
            email
            phone
            avatar
            bio
            cover
            role {
              _id
              name
            }
          }
        }
      }
    """;

    try {
      String? rToken = await AppSecureStorage.getRefreshToken();
      var result = await client.value.mutate(MutationOptions(
        document: gql(signupMutation),
        variables: {'refreshToken': rToken},
      ));

      if (result.hasException) {
        debugPrint('Token Refreshed: ❌❌');
        await showTopAlertDialog(text: 'Refresh - Something went wrong!');
      } else {
        debugPrint('Token Refreshed: ✅');
        String accessToken = await _setAccessAndRefreshTokens('refreshToken', result);
        var user = UserModel.fromMap(user: result.data?['login']['user']);
        return user;
      }
    } catch (e) {
      debugPrint('Token Refreshed: ❌');
    }
  }
  
  Future<void> logout() async {
    await AppSecureStorage.deleteToken();
    await AppSecureStorage.deleteRefreshToken();
    userProvider.removeUser();
  }

  Future<String> _setAccessAndRefreshTokens(String key, QueryResult<Object?> result) async {
    String accessToken = result.data?[key]['access_token'];
    String refreshToken = result.data?[key]['refresh_token'];
    await AppSecureStorage.setToken(accessToken);
    await AppSecureStorage.setRefreshToken(refreshToken);
    return accessToken;
  }
}