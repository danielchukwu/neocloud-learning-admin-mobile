import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/FacultyModel.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
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
        throw Exception(result.exception);
      } else {
        List? faculties = result.data?['faculties'];

        if (faculties == null) {
          return [];
        }

        List<FacultyModel> facList =
            faculties.map((fac) => FacultyModel.fromMap(faculty: fac)).toList();
        print('Faculties');
        print(facList);

        return facList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
