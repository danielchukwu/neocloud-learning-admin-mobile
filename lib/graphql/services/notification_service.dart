import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/NotificationModel.dart';

class NotificationService {
  static var config = GraphQLConfig();
  var client = config.client;

  Future<List<NotificationModel>> getNotifications({int? limit}) async {
    String notiQuery = """
      query Query(\$limit: Int) {
        notifications(limit: \$limit) {
          _id
          body
          classInstance {
            _id
            isCompleted
            class {
              _id
              name
            }
          }
          classwork {
            _id
            title
          }
          faculty {
            _id
            name
          }
          notificationType {
            _id
            name
          }
          user {
            _id
            avatar
            name
          }
        }
      }
    """;

    try {
      var result = await client.value.query(QueryOptions(
        document: gql(notiQuery),
        variables: {'limit': limit ?? 100},
      ));

      if (result.hasException) {
        throw Exception(result.exception);
      } else {
        List? notifications = result.data?['notifications'];

        if (notifications == null) {
          return [];
        }

        List<NotificationModel> notiList =
            notifications.map((notification) => NotificationModel.fromMap(n: notification)).toList();
        print('notifications');
        print(notiList);

        return notiList;
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}