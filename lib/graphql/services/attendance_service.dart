import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/AttendanceModel.dart';

class AttendanceService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<AttendanceModel>> getAtendances({int? limit}) async {
    String attQuery = """
      query ExampleQuerys(\$limit: Int) {
        attendances(limit: \$limit) {
          _id
          class {
            _id
            name
          }
          classSchedule {
            _id
            title
          }
          user {
            _id
            name
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(attQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? attendances = result.data?['attendances'];

        if (attendances == null) {
          return [];
        }

        List<AttendanceModel> attList =
            attendances.map((cw) => AttendanceModel.fromMap(att: cw)).toList();
        print('attendances');
        print(attList);

        return attList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}