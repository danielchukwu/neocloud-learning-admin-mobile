import 'package:flutter/cupertino.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

class ClassService {
  // (){} "" <> ? _ ! *
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<ClassModel>> getClasses(BuildContext context, {int? limit}) async {
    String classesQuery = """
      query Query(\$limit: Int, \$name: String) {
        classes(limit: \$limit, name: \$name) {
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
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        return handleErrors(context, result);
      } else {
        List? classes = result.data?['classes'];

        if (classes == null) {
          return [];
        }

        List<ClassModel> classList =
            classes.map((clas) => ClassModel.fromMap(aClass: clas)).toList();
        print('Classes');
        print(classList);

        return classList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}