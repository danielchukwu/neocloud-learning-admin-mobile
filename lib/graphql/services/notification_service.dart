import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups/popups.dart';
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
          seen
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
          createdAt
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
        debugPrint('Notifications: $notifications');

        // this helps us set all notifications seen to true only 
        // if the notifications result was fetched from cache
        // which would mean that it had already been fetched and seen 
        // before by the user before it was cached, so therefore if user fetches 
        // it again but this time from cache, all the notifications should be marked as seen = true
        bool? seen = result.source == QueryResultSource.cache ? true : null;
        debugPrint('RESULTS SOURCE: ${result.source}');
        List<NotificationModel> notiList =
            notifications.map((notification) => NotificationModel.fromMap(n: notification, seen: seen)).toList();
        debugPrint('NotiList: $notiList');

        return notiList;
      }
    } catch (e) {
      debugPrint("getNotifications Status: ❌");
      showTopAlertDialog(text: 'Something went wrong!');
      throw Exception(e);
    }
  }
}