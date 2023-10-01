import 'package:neocloud_mobile/core/entities/user_entity.dart';

abstract class RemoteUserEvent {
  final String text;
  final List<UserEntity> existingUsers;
  final int page;
  const RemoteUserEvent({required this.text, required this.existingUsers, required this.page});
}

class GetUserEvent extends RemoteUserEvent {
  const GetUserEvent({required super.text, required super.existingUsers, required super.page});
}