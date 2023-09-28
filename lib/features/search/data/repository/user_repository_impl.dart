import 'package:neocloud_mobile/features/search/data/data_sources/remote/search_service.dart';
import 'package:neocloud_mobile/features/search/domain/entities/user_entity.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/repository/user_repository.dart';
import 'package:neocloud_mobile/graphql/models/UserModel.dart';

class UserRepositoryImpl implements UserRepository {
  final SearchService _apiService;

  UserRepositoryImpl(this._apiService);
  
  @override
  Future<DataState<List<UserEntity>>> getUsers({required String name, int ? limit}) async {
    var usersList = await _apiService.getUsers(limit: limit, name: name);
    print('Users List');
    print(usersList);


    throw UnimplementedError();

    // return DataSuccess<List<UserModel>>(usersList);
  }
}