import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/repository/class_repository.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/usecase.dart';

class GetClassUseCase implements UseCase<DataState<List<ClassEntity>>, String, int> {
  final ClassRepository _classRepository;

  const GetClassUseCase(this._classRepository);
  
  @override
  Future<DataState<List<ClassEntity>>> call({required String param1, int ? param2}) {
    return _classRepository.getClasses(name: param1, page: param2);
  }
}