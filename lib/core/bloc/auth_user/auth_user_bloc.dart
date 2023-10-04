import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';

part 'auth_user_event.dart';
part 'auth_user_state.dart';

class AuthUserBloc extends Bloc<AuthUserEvent, AuthUserState> {
  AuthUserBloc() : super(AuthUserInitialState()) {
    on<SetAuthUserEvent>(_onSetAuthUserEvent);
  }

  FutureOr<void> _onSetAuthUserEvent(AuthUserEvent event, Emitter<AuthUserState> emit) {
    emit(AuthUserDoneState(event.authUser!));
  }
}