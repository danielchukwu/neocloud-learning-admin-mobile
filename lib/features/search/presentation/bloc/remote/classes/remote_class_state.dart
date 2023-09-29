part of 'remote_class_bloc.dart';

abstract class RemoteClassesState extends Equatable {
  final List<ClassEntity> ? classes;
  final Exception ? exception;

  const RemoteClassesState({this.classes, this.exception});

  @override
  List<Object?> get props => [classes, exception];
}

class RemoteClassesLoadingState extends RemoteClassesState {
  const RemoteClassesLoadingState();
}

class RemoteClassesInitialState extends RemoteClassesState {
  const RemoteClassesInitialState();
}

class RemoteClassesDoneState extends RemoteClassesState {
  const RemoteClassesDoneState(List<ClassEntity> classes) : super(classes: classes);
}

class RemoteClassesFailState extends RemoteClassesState {
  const RemoteClassesFailState(Exception exception) : super(exception: exception);
}