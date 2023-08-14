import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

class SearchService {
  // (){} "" <> ? _ ! *
  static var config = GraphQLConfig();
  var client = config.client;

  Future<Map<String, List<dynamic>>> getUsersClasses({int? limit, String? name}) async {
    String classesQuery = """
      query Query(\$limit: Int, \$className: String, \$userName: String) {
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
      var result = await client.value.query(QueryOptions(
        document: gql(classesQuery),
        variables: {'limit': limit, 'className': name, 'userName': name},
      ));

      if (result.hasException) {
        debugPrint("getUsersClasses Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getUsersClasses(limit: limit, name: name);
        }
        return {'classes': [], 'users': []};
      } else {
        debugPrint("getUsersClasses Status: ✅");

        List? classes = result.data?['classes'];
        List? users = result.data?['users'];

        if (classes == null || users == null) return {'users': [], 'classes': []};

        List<ClassModel> classList =
            classes.map((clas) => ClassModel.fromMap(aClass: clas)).toList();
        List<UserModel> userList =
            users!.map((user) => UserModel.fromMap(user: user)).toList();

        print('classes and users');
        print(classList);
        print(userList);

        return {'users': userList, 'classes': classList};
      }
    } catch (e) {
      debugPrint("getUsersClasses Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}