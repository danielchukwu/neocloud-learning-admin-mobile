import 'package:flutter/material.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';


class SearchService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<UserModel>> getUsers({int? limit, String? name}) async {
    String usersQuery = """
      query Query(\$limit: Int, \$userName: String) {
        users(name: \$userName, limit: \$limit) {
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
      print('TOKEN BEFORE');
      print(await AppSecureStorage.getToken());
      // print(await client.value);

      var result = await client.value.query(QueryOptions(
        document: gql(usersQuery),
        variables: {'limit': limit, 'userName': name},
      ));

      print('TOKEN AFTER');
      print(await AppSecureStorage.getToken());

      print('RESULT:');
      print(result);

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

        if (users == null) [];

        List<UserModel> userList =
            users!.map((user) => UserModel.fromMap(user: user)).toList();

        print(userList);

        return userList;
      }
    } catch (e) {
      debugPrint("getUsers Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }

  Future<List<ClassModel>> getClasses({int? limit, String? name}) async {
    String classesQuery = """
      query Query(\$limit: Int, \$className: String) {
        classes(limit: \$limit, name: \$className) {
          _id
          name
          about
          avatar
          faculty {
            _id
            name
            hod {
              _id
              name
            }
          }
          educators {
            _id
            name
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(classesQuery),
        variables: {'limit': limit, 'className': name},
      ));

      if (result.hasException) {
        debugPrint("getClasses Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getClasses(limit: limit, name: name);
        }
        return [];
        
      } else {
        debugPrint("getClasses Status: ✅");

        List? classes = result.data?['classes'];

        if (classes == null) return [];

        List<ClassModel> classList =
          classes.map((clas) => ClassModel.fromMap(aClass: clas)).toList();

        return classList;
      }
    } catch (e) {
      debugPrint("getClasses Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }

}