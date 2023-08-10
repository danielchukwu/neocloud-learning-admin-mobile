import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLConfig {
  static HttpLink link = HttpLink('https://neocloud-school-portal-bk.onrender.com/graphql');

  GraphQLClient client = GraphQLClient(cache: GraphQLCache(), link: link);
}