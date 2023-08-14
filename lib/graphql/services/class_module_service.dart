import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class ClassModuleService {
  // (){} "" <> ? _ ! *
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<ClassModuleModel>> getClassModules({int? limit, required String classId}) async {
    String classModulesQuery = """
      query ExampleQuery(\$classId: ID) {
        classModules(classId: \$classId) {
          _id
          title
          order
          classSchedules {
            _id
            title
            description
            date
            order
            startTime
            endTime
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(classModulesQuery),
        variables: {'limit': limit ?? 100, classId: classId},
      ));

      if (result.hasException) {
        debugPrint("getClassModules Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getClassModules(limit: limit, classId: classId);
        }
        return [];
      } else {
        debugPrint("getClasses Status: ✅");

        List? classModules = result.data?['classModules'];
        if (classModules == null) return [];
        List<ClassModuleModel> classModulesList =
            classModules.map((classM) => ClassModuleModel.fromMap(classModule: classM)).toList();

        return classModulesList;
      }
    } catch (e) {
      debugPrint("getClassModules Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}