import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class AuthService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<String> login(BuildContext context, {required String email, required String password}) async {
    debugPrint('LOGIN REQUEST SENT......  ');
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
        // return handleErrors(context, result);
        String error = handleErrors(context, result);
        if (error == 'jwt expired') {
          await AppSecureStorage.deleteToken();
          await refreshToken(context);
          return await login(context, email: email, password: password);
        }
        return error;
      } else {
        String accessToken = await _setAccessAndRefreshTokens('login', result);
        return accessToken;
      }
    } catch (e) {
      print(e);
      showTopAlertDialog(context, text: 'Something went wrong!');
      return 'Exception caught';
    }
  }

  Future<String> signup(BuildContext context, {required String name, required String phone, required String email, required String password}) async {
    debugPrint('SIGNUP REQUEST SENT......  ');
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
        variables: { "name": name, "email": email, "phone": phone, "password": password},
        // variables: { "name": "chukwu daniel", "email": "00danzy@gmail.com", "phone": "09031420494", "password": "Password123_" },
      ));

      if (result.hasException) {
        return handleErrors(context, result);
      } else {
        String accessToken = await _setAccessAndRefreshTokens('signup', result);
        return accessToken;
      }
    } catch (e) {
      showTopAlertDialog(context, text: 'Something went wrong!');
      return 'Exception caught';
    }
  }

  Future<String> refreshToken(BuildContext context) async {
    debugPrint('SIGNUP REQUEST SENT......  ');
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
      String rToken = await AppSecureStorage.getRefreshToken();
      var result = await client.value.mutate(MutationOptions(
        document: gql(signupMutation),
        variables: {'refreshToken': rToken},
      ));

      if (result.hasException) {
        return handleErrors(context, result);
      } else {
        print('token refreshed successfully');
        String accessToken = await _setAccessAndRefreshTokens('refreshToken', result);
        print(accessToken);
        return accessToken;
      }
    } catch (e) {
      showTopAlertDialog(context, text: 'Something went wrong!');
      return 'Exception caught';
    }
  }
  
  Future<String> _setAccessAndRefreshTokens(String key, QueryResult<Object?> result) async {
    String accessToken = result.data?[key]['access_token'];
    String refreshToken = result.data?[key]['refresh_token'];
    debugPrint(accessToken);
    await AppSecureStorage.setToken(accessToken);
    await AppSecureStorage.setRefreshToken(refreshToken);
    return accessToken;
  }

}
