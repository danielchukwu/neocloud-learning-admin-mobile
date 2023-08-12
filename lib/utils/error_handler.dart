import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/components/popups.dart';

handleErrors(BuildContext context, QueryResult<Object?> result) {
  List<GraphQLError>? graphqlErrors = result.exception?.graphqlErrors;

  // handle field errors
  if (graphqlErrors != null && graphqlErrors.length > 0) {
    var errors = graphqlErrors[0].extensions?['errors'];
    var errorValues = errors.values.toList();
    showTopAlertDialog(context, text: errorValues.join(', '));
    return errorValues.join(', ');
  }

  // jwt expiration
  print('JWT EXPIRATION');
  if ('$result'.contains('jwt expired')) {

    showTopAlertDialog(context, text: 'jwt expired');
    return 'jwt expired';
  }
  
  showTopAlertDialog(context, text: 'An error occurred!');
  return 'An error has occurred!';
}
