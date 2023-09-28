import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/entities/user_entity.dart';
import 'package:neocloud_mobile/features/search/domain/repository/user_repository.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/usecase.dart';

class GetUsersUseCase implements UseCase<DataState<List<UserEntity>>, String> {
  final UserRepository _userRepository;

  const GetUsersUseCase(this._userRepository);

  @override
  Future<DataState<List<UserEntity>>> call({required String param}) async {
    return await _userRepository.getUsers(name: param);
  }
}
