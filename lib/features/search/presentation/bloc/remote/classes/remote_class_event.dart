part of 'remote_class_bloc.dart';

abstract class RemoteClassesEvent {
  final String text;
  final List<ClassEntity> existingClasses;
  final int page;

  RemoteClassesEvent({required this.text, required this.existingClasses, required this.page});
}

class GetClassesEvent extends RemoteClassesEvent {
  GetClassesEvent({required super.text, required super.existingClasses, required super.page});
}
