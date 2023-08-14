import 'package:flutter/material.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';

class FacultyService {
  // (){} "" <> ? _ ! *
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<FacultyModel>> getFaculties({int? limit}) async {
    String facultiesQuery = """
        query ExampleQuery(\$limit: Int) {
          faculties(limit: \$limit) {
            _id
            name
            about
            hod {
              _id
              name
            }
          }
        }
      """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(facultiesQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        debugPrint("getFaculties Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getFaculties(limit: limit);
        }
        return [];
      } else {
        debugPrint("getFaculties Status: ✅");

        List? faculties = result.data?['faculties'];
        if (faculties == null) return [];
        List<FacultyModel> facList =
            faculties.map((fac) => FacultyModel.fromMap(faculty: fac)).toList();

        return facList;
      }
    } catch (e) {
      debugPrint("getFaculties Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}
