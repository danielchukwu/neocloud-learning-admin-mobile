import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class UserService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<UserModel>> getUsers({int? limit, String? name}) async {
    String userQuery = """
      query Query(\$name: String, \$limit: Int) {
        users(name: \$name, limit: \$limit) {
          _id
          name
          bio
          avatar
          cover
          email
          phone
          role {
            _id
            name
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(userQuery),
        variables: {'limit': limit, 'name': name},
      ));

      if (result.hasException) {
        debugPrint("getUsers Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getUsers(limit: limit, name: name);
        }
        return [];
      } else {
        debugPrint("getUsers Status: ✅");

        List? users = result.data?['users'];
        if (users == null) return [];
        List<UserModel> userList = users.map((user) => UserModel.fromMap(user: user)).toList();

        return userList;
      }
    } catch (e) {
      debugPrint("getUsers Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}