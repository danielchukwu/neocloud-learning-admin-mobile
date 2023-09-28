import 'package:equatable/equatable.dart';
import 'package:neocloud_mobile/features/search/domain/entities/user_entity.dart';

abstract class RemoteUserState extends Equatable {
  final List<UserEntity> ? users;
  final Error ? error;

  const RemoteUserState({this.users, this.error});

  @override
  List<Object?> get props => [users, error];
}

class RemoteUserLoadingState extends RemoteUserState {
  const RemoteUserLoadingState();
}

class RemoteUserWaitingState extends RemoteUserState {
  const RemoteUserWaitingState();
}

class RemoteUserDoneState extends RemoteUserState {
  const RemoteUserDoneState(List<UserEntity> users) : super(users: users);
}

class RemoteUserErrorState extends RemoteUserState {
  const RemoteUserErrorState(Error error) : super(error: error);
}