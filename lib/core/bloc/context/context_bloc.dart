import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'context_event.dart';
part 'context_state.dart';

class ContextBloc extends Bloc<ContextEvent, ContextState> {
  ContextBloc() : super(ContextInitialState()) {
    on<SetContextEvent>(_onSetContextEvent);
  }

  Future<void> _onSetContextEvent(ContextEvent event, Emitter<ContextState> emit) async {
    emit(ContextDoneState(event.context!));
  }
}