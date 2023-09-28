import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/entities/class_entity.dart';
import 'package:neocloud_mobile/features/search/domain/repository/class_repository.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/usecase.dart';

class GetClassUseCase implements UseCase {
  final ClassRepository _classRepository;

  const GetClassUseCase(this._classRepository);
  
  @override
  Future<DataState<List<ClassEntity>>> call({param}) {
    return _classRepository.getClasses();
  }
}