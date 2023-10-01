import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';
import 'package:neocloud_mobile/features/search/data/data_sources/remote/search_service.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/repository/user_repository.dart';


class UserRepositoryImpl implements UserRepository {
  final SearchService _apiService;

  UserRepositoryImpl(this._apiService);
  
  @override
  Future<DataState<List<UserEntity>>> getUsers({required String name, int ? page}) async {
    try {
      final users = await _apiService.getUsers(page: page, name: name);
      return DataSuccess<List<UserEntity>>(users);
    } on Exception catch (e) {
      showTopAlertDialog(text: 'Something went wrong!');
      return DataError(e);
    }
  }
}