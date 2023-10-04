part of 'context_bloc.dart';

abstract class ContextState {
  final BuildContext ? context;

  ContextState({this.context});
}

class ContextInitialState extends ContextState {
  ContextInitialState();
}

class ContextDoneState extends ContextState {
  ContextDoneState(BuildContext context) : super(context: context);
}