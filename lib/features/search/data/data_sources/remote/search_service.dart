import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/core/models/class_model.dart';
import 'package:neocloud_mobile/core/models/user_model.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';


class SearchService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<UserModel>> getUsers({int? page, String? name}) async {
    String usersQuery = """
      query Query(\$page: Int, \$userName: String) {
        users(name: \$userName, page: \$page) {
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
      print(page);
      var result = await client.value.query(QueryOptions(
        document: gql(usersQuery),
        variables: {'page': page ?? 1, 'userName': name},
      ));

      if (result.hasException) {
        debugPrint("getUsers Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getUsers(page: page, name: name);
        }
        return [];
        
      } else {
        debugPrint("getUsers Status: ✅");

        List? users = result.data?['users'];

        if (users == null) [];

        List<UserModel> userList =
            users!.map((user) => UserModel.fromMap(user: user)).toList();

        return userList;
      }
    } catch (e) {
      debugPrint("getUsers Status: ❌");
      throw Exception(e);
    }
  }

  Future<List<ClassModel>> getClasses({int? page, String? name}) async {
    String classesQuery = """
      query Query(\$page: Int, \$className: String) {
        classes(page: \$page, name: \$className) {
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
        variables: {'page': page ?? 1, 'className': name},
      ));

      if (result.hasException) {
        debugPrint("getClasses Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getClasses(page: page, name: name);
        }
        return [];
        
      } else {
        debugPrint("getClasses Status: ✅");

        List? classes = result.data?['classes'];

        if (classes == null) return [];

        List<ClassModel> classList =
          classes.map((clas) => ClassModel.fromMap(data: clas)).toList();

        return classList;
      }
    } catch (e) {
      debugPrint("getClasses Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }

}