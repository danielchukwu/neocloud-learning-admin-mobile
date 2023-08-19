import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassInstanceModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class ClassInstanceService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<ClassInstanceModel>> getClassInstances({int? limit}) async {
    String ciQuery = """
      query ClassInstances(\$limit: Int) {
        classInstances(limit: \$limit) {
          _id
          isCompleted
          class {
            _id
            name
          }
          educator {
            _id
            name
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(ciQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        debugPrint("getClassInstances Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getClassInstances(limit: limit);
        }
        return [];
      } else {
        debugPrint("getClassInstances Status: ✅");

        List? classInstances = result.data?['classInstances'];
        if (classInstances == null) return [];
        List<ClassInstanceModel> ciList = 
            classInstances.map((ci) => ClassInstanceModel.fromMap(ci: ci)).toList();

        return ciList;
      }
    } catch (e) {
      debugPrint("getClassInstances Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}