part of 'auth_user_bloc.dart';

abstract class AuthUserEvent {
  final UserEntity ? authUser;

  AuthUserEvent({this.authUser});
}

class SetAuthUserEvent extends AuthUserEvent {
  SetAuthUserEvent(UserEntity user) : super(authUser: user);
}
