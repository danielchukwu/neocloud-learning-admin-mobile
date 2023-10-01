import 'package:neocloud_mobile/components/popups/popups.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/core/models/class_model.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/repository/class_repository.dart';
import 'package:neocloud_mobile/features/search/data/data_sources/remote/search_service.dart';


class ClassRepositoryImpl implements ClassRepository {
  final SearchService _apiService;

  ClassRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ClassEntity>>> getClasses({required String name, int ? page}) async {
    try {
      final classes = await _apiService.getClasses(page: page, name: name);
      return DataSuccess<List<ClassModel>>(classes);
    } on Exception catch (e) {
      showTopAlertDialog(text: 'Something went wrong!');
      return DataError(e);
    }
  }

}