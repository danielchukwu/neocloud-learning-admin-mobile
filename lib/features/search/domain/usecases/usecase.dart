abstract class UseCase<Type, Param1, Param2> {
  Future<Type> call({required Param1 param1, required Param2 param2});
}