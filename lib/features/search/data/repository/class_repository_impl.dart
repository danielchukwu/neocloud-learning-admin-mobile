import 'package:neocloud_mobile/features/search/domain/entities/class_entity.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/repository/class_repository.dart';
import 'package:neocloud_mobile/features/search/data/data_sources/remote/search_service.dart';


class ClassRepositoryImpl implements ClassRepository {
  final SearchService _apiService;

  ClassRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ClassEntity>>> getClasses() {
    // TODO: implement getClasses
    throw UnimplementedError();
  }

}