part of 'remote_class_bloc.dart';

abstract class RemoteClassesEvent {
  final String text;

  RemoteClassesEvent(this.text);
}

class GetClassesEvent extends RemoteClassesEvent {
  GetClassesEvent(String text) : super(text);
}
