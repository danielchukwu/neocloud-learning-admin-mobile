import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/graphql_config.dart';
import 'package:neocloud_mobile/graphql/models/NotificationModel.dart';
import 'package:neocloud_mobile/utils/error_handler.dart';

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
          type {
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
        debugPrint("getNotifications Status: ❌❌");
        String error = await handleErrors(result);
        if (error == 'jwt expired') {
          return await getNotifications(limit: limit);
        }
        return [];
      } else {
        debugPrint("getNotifications Status: ✅");

        List? notifications = result.data?['notifications'];
        if (notifications == null) return [];
        List<NotificationModel> notiList =
            notifications.map((notification) => NotificationModel.fromMap(n: notification)).toList();

        return notiList;
      }
    } catch (e) {
      debugPrint("getNotifications Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}