import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/ClassworkModel.dart';

class ClassworkService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<ClassworkModel>> getClassworks({int? limit}) async {
    String classesQuery = """
      query ExampleQuerys(\$limit: Int) {
        classworks(limit: \$limit) {
          _id
          title
          body
          deadline
          class {
            _id
            name
            educators {
              _id
              avatar
              name
            }
          }
          classSchedule {
            _id
            title
            classModule {
              _id
              title
              order
            }
          }
          faculty {
            _id
            name
          }
        }
      }
    """;

    try {
      var result = await client.query(QueryOptions(
        document: gql(classesQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? classworks = result.data?['classworks'];

        if (classworks == null) {
          return [];
        }

        List<ClassworkModel> cwList =
            classworks.map((cw) => ClassworkModel.fromMap(cw: cw)).toList();
        print('classworks');
        print(cwList);

        return cwList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}