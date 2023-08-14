import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:neocloud_mobile/app_secure_storage.dart';
import 'package:neocloud_mobile/components/popups.dart';
import 'package:neocloud_mobile/graphql/services/auth_service.dart';

handleErrors(QueryResult<Object?> result) async {
  List<GraphQLError>? graphqlErrors = result.exception?.graphqlErrors;

  // handle field errors
  if (graphqlErrors != null && graphqlErrors.length > 0) {
    debugPrint('handleError: field errors 🧺');
    var errors = graphqlErrors[0].extensions?['errors'];
    var errorValues = errors.values.toList();
    showTopAlertDialog(text: errorValues.join(', '));
    debugPrint('handleError: field errors ✅');
    return errorValues.join(', ');
  }

  // jwt expiration
  if ('$result'.contains('jwt expired')) {
    debugPrint('handleError: jwt expired - refreshing token 🔃');
    await AppSecureStorage.deleteToken();
    await AuthService().refreshToken();
    debugPrint('handleError: jwt expired - refreshing token ✅');
    return 'jwt expired';
  }

  debugPrint('handleError: Catch All ✅');
  showTopAlertDialog(text: 'An error occurred!');
  return 'An error occurred!';
}
