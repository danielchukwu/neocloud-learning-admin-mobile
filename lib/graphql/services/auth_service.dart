import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';

class AuthService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<String?> login({required String email, required String password}) async {
    debugPrint('LOGIN REQUEST SENT......  ');
    String loginMutation = """
      mutation Login(\$email: String, \$password: String) {
        login(email: \$email, password: \$password)
      }
    """;

    try {
      var result = await client.mutate(MutationOptions(
        document: gql(loginMutation),
        variables: {"email": email, "password": password},
        // variables: {"email": "00danzy@gmail.com", "password": "Password123_"},
      ));
      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        String jwtToken = result.data?['login'];
        await AppSecureStorage.setToken(jwtToken);
        return jwtToken;
      }
    } catch (e) {
      return null;
    }
  }

  Future<String> signup({required String name, required String phone, required String email, required String password}) async {
    debugPrint('SIGNUP REQUEST SENT......  ');
    String signupMutation = """
      mutation Signup(\$name: String, \$email: String, \$phone: String, \$password: String) {
        signup(name: \$name, email: \$email, phone: \$phone, password: \$password)
      }
    """;

    try {
      var result = await client.mutate(MutationOptions(
        document: gql(signupMutation),
        variables: { "name": name, "email": email, "phone": phone, "password": password},
        // variables: { "name": "chukwu daniel", "email": "00danzy@gmail.com", "phone": "09031420494", "password": "Password123_" },
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        String jwtToken = result.data?['signup'];
        debugPrint(jwtToken);
        await AppSecureStorage.setToken(jwtToken);
        return jwtToken;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
