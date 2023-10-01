import 'package:neocloud_mobile/core/entities/user_entity.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';

abstract class UserRepository {
  Future<DataState<List<UserEntity>>> getUsers({required String name, int ? page});
}