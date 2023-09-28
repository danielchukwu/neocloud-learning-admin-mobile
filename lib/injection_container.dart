import 'package:get_it/get_it.dart';
import 'package:neocloud_mobile/features/search/domain/repository/class_repository.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/get_class.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/get_users.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_bloc.dart';

import 'features/search/data/data_sources/remote/search_service.dart';
import 'features/search/data/repository/class_repository_impl.dart';
import 'features/search/data/repository/user_repository_impl.dart';
import 'features/search/domain/repository/user_repository.dart';

final sl = GetIt.instance;

void initiallizeDependencies () {
  // Data
  sl.registerSingleton<SearchService>(SearchService());
  sl.registerSingleton<UserRepository>(UserRepositoryImpl(sl()));
  sl.registerSingleton<ClassRepository>(ClassRepositoryImpl(sl()));

  // Domain
  sl.registerSingleton<GetUsersUseCase>(GetUsersUseCase(sl()));
  sl.registerSingleton<GetClassUseCase>(GetClassUseCase(sl()));

  // Presentation (bloc)
  sl.registerFactory<RemoteUserBloc>(() => RemoteUserBloc(sl()));
}