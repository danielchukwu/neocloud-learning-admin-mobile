import 'package:neocloud_mobile/core/resources/data_state.dart';
import 'package:neocloud_mobile/features/search/domain/entities/class_entity.dart';

abstract class ClassRepository {
  Future<DataState<List<ClassEntity>>> getClasses();
}