import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/core/entities/user_entity.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/get_users.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_event.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_state.dart';
class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUsersState> {
  final GetUsersUseCase _getUsersUseCase;

  RemoteUserBloc(this._getUsersUseCase) : super(const RemoteUsersInitialState()) {
    on<GetUserEvent>(onGetUsers);
  }
  Future<void> onGetUsers(GetUserEvent getUserEvent, Emitter<RemoteUsersState> emit) async {
    if (getUserEvent.text.isEmpty) {
      var initialState = const RemoteUsersInitialState();
      return emit(initialState);
    }

    if (getUserEvent.page == 1) {
      emit(const RemoteUsersLoadingState());
    } else {
      emit(RemoteUsersLoadingMoreState(getUserEvent.existingUsers));
    }
    
    final dataState = await _getUsersUseCase.call(param1: getUserEvent.text, param2: getUserEvent.page);

    if (dataState.data != null) {
      final newState = RemoteUsersDoneState([...getUserEvent.existingUsers, ...dataState.data!]);
      emit(newState);
    } else {
      print('Bloc Data State Error Encountered 😄!');
    }
  }
}
