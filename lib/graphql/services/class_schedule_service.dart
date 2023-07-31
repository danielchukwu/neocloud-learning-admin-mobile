import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassScheduleModel.dart';

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
      var result = await client.query(QueryOptions(
        document: gql(csQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? classSchedule = result.data?['classSchedule'];

        if (classSchedule == null) {
          return [];
        }

        List<ClassScheduleModel> csList =
            classSchedule.map((cs) => ClassScheduleModel.fromMap(cs: cs)).toList();
        print('classSchedule');
        print(csList);

        return csList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}