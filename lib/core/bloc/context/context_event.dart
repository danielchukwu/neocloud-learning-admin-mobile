part of 'context_bloc.dart';

abstract class ContextEvent {
  final BuildContext ? context;

  ContextEvent({this.context});
}

class SetContextEvent extends ContextEvent {
  SetContextEvent(BuildContext context) : super(context: context);
}