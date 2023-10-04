part of 'auth_user_bloc.dart';

abstract class AuthUserState {
  final UserEntity ? authUser;

  AuthUserState({this.authUser});
}

class AuthUserInitialState extends AuthUserState {
  AuthUserInitialState();
}

class AuthUserDoneState extends AuthUserState {
  AuthUserDoneState(UserEntity user) : super(authUser: user);
}