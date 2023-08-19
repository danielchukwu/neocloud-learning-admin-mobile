import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/AttendanceModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

class AttendanceService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<AttendanceModel>> getAttendances({int? limit}) async {
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
        debugPrint("getAttendances Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getAttendances(limit: limit);
        }
        return [];
      } else {
        debugPrint("getAttendances Status: ✅");
        
        List? attendances = result.data?['attendances'];
        if (attendances == null) return [];
        List<AttendanceModel> attList =
            attendances.map((cw) => AttendanceModel.fromMap(att: cw)).toList();

        return attList;
      }
    } catch (e) {
      debugPrint("getAttendances Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}