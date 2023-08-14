import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class ClassScheduleService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<ClassScheduleModel>> getClassSchedules({int? limit}) async {
    String csQuery = """
      query Query(\$limit: Int) {
        classSchedules(limit: \$limit) {
          _id
          order
          title
          description
          date
          startTime
          endTime
          classModule {
            _id
            title
            class {
              _id
              name
              educators {
                _id
                name
                avatar
              }
            }
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(csQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        debugPrint("getClassSchedules Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getClassSchedules(limit: limit);
        }
        return [];
      } else {
        debugPrint("getClassSchedules Status: ✅");

        List? classSchedule = result.data?['classSchedules'];
        if (classSchedule == null) return [];
        List<ClassScheduleModel> csList =
            classSchedule.map((cs) => ClassScheduleModel.fromMap(cs: cs)).toList();

        return csList;
      }
    } catch (e) {
      debugPrint("getClassSchedules Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}