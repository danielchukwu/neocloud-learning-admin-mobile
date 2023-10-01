import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/core/resources/data_state.dart';

abstract class ClassRepository {
  Future<DataState<List<ClassEntity>>> getClasses({required String name, int ? page});
}