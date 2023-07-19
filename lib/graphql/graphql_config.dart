import 'package:graphql_flutter/graphql_flutter.dart';

// : (){} "" <> ? _ ! *
class GraphQLConfig {
  static HttpLink link = HttpLink('https://neocloud-school-portal-bk.onrender.com/graphql');
  // static HttpLink link = HttpLink('https://books-demo-apollo-server.herokuapp.com/');
  // static HttpLink link = HttpLink('http://localhost:8000/graphql');

  GraphQLClient client = GraphQLClient(cache: GraphQLCache(), link: link);
}