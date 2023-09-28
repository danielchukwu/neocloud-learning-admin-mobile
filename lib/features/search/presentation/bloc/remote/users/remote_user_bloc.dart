import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/get_users.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_event.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/remote/users/remote_user_state.dart';

class RemoteUserBloc extends Bloc<RemoteUserEvent, RemoteUserState> {
  final GetUsersUseCase _getUsersUseCase;

  RemoteUserBloc(this._getUsersUseCase) : super(const RemoteUserWaitingState()) {
    on<GetUserEvent>(onGetUsers);
  }

  void onGetUsers(GetUserEvent getUserEvent, Emitter<RemoteUserState> emit) {
    print('onGetUsers RAN!');
    final data = _getUsersUseCase.call(param: getUserEvent.text);
  }
}