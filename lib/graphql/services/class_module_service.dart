import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassModuleModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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
      print('result');
      print(result);

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? classModules = result.data?['classModules'];

        if (classModules == null) {
          return [];
        }

        List<ClassModuleModel> classModulesList =
            classModules.map((classM) => ClassModuleModel.fromMap(classModule: classM)).toList();
        print('classModules');
        print(classModulesList);

        return classModulesList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}