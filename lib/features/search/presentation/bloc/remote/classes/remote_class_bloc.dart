import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/core/entities/class_entity.dart';
import 'package:neocloud_mobile/features/search/domain/usecases/get_class.dart';

part 'remote_class_event.dart';
part 'remote_class_state.dart';

class RemoteClassBloc extends Bloc<RemoteClassesEvent, RemoteClassesState> {
  final GetClassUseCase _getClassUseCase;

  RemoteClassBloc(this._getClassUseCase) : super(const RemoteClassesInitialState()) {
    on<GetClassesEvent>(onGetClassesEvent);
  }

  Future<void> onGetClassesEvent(RemoteClassesEvent getClassesEvent, Emitter<RemoteClassesState> emit) async {
    if (getClassesEvent.text.isEmpty) {
      var initialState = const RemoteClassesInitialState();
      return emit(initialState);
    }

    if (getClassesEvent.page == 1) {
      emit(const RemoteClassesLoadingState());
    } else {
      emit(RemoteClassesLoadingMoreState(getClassesEvent.existingClasses));
    }

    final dataState = await _getClassUseCase.call(param1: getClassesEvent.text, param2: getClassesEvent.page);
    if (dataState.data != null) {
      final newState = RemoteClassesDoneState([...getClassesEvent.existingClasses, ...dataState.data!]);
      emit(newState);
    }else {
      print('Dat State Classes Error 😄!');
    }
  }
}