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

  Future<void> onGetClassesEvent(RemoteClassesEvent event, Emitter<RemoteClassesState> emit) async {
    emit(const RemoteClassesLoadingState());
    final dataState = await _getClassUseCase.call(param1: event.text);
    final newState = RemoteClassesDoneState(dataState.data!);
    emit(newState);
  }
}