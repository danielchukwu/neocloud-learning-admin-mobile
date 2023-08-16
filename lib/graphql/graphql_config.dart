import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';

class GraphQLConfig {
  static HttpLink httpLink = HttpLink('https://neocloud-school-portal-bk.onrender.com/graphql');

  static final AuthLink authLink = AuthLink(
    getToken: () async {
      String? token = await AppSecureStorage.getToken();
      return 'Bearer $token';
    },
    headerKey: 'Authorization',
  );

  static final Link link = authLink.concat(httpLink);
  
  
  // GraphQLClient client = GraphQLClient(cache: GraphQLCache(), link: link);
  final ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      cache: GraphQLCache(),
      link: link,
    ),
  );

  // Future<String?> token() async => await AppSecureStorage.getToken();
}