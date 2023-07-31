import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

class UserService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<UserModel>> getUsers({int? limit}) async {
    String userQuery = """
      query Query(\$limit: Int) {
        users(limit: \$limit) {
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
      var result = await client.query(QueryOptions(
        document: gql(userQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? users = result.data?['users'];

        if (users == null) {
          return [];
        }

        List<UserModel> userList =
            users.map((user) => UserModel.fromMap(user: user)).toList();
        print('users');
        print(userList);

        return userList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}