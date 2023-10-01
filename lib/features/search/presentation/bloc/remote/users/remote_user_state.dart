import 'package:equatable/equatable.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';

abstract class RemoteUsersState extends Equatable {
  final List<UserEntity> ? users;
  final Error ? error;

  const RemoteUsersState({this.users, this.error});

  @override
  List<Object?> get props => [users, error];
}

class RemoteUsersLoadingState extends RemoteUsersState {
  const RemoteUsersLoadingState();
}
class RemoteUsersLoadingMoreState extends RemoteUsersState {
  const RemoteUsersLoadingMoreState(List<UserEntity> ? existingUsers) : super(users: existingUsers);
}

class RemoteUsersInitialState extends RemoteUsersState {
  const RemoteUsersInitialState();
}

class RemoteUsersDoneState extends RemoteUsersState {
  const RemoteUsersDoneState(List<UserEntity> users) : super(users: users);
}

class RemoteUsersFailState extends RemoteUsersState {
  const RemoteUsersFailState(Error error) : super(error: error);
}