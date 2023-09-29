import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'search_navbar_state.dart';
part 'search_navbar_event.dart';


class SearchNavbarBloc extends Bloc<SearchNavbarEvent, SearchNavbarState> {
  SearchNavbarBloc() : super(SearchNavbarAllState()) {
    on<SearchNavbarAllEvent>(onAllEvent);
    on<SearchNavbarEducatorsEvent>(onEducatorsEvent);
    on<SearchNavbarStudentsEvent>(onStudentsEvent);
    on<SearchNavbarClassesEvent>(onClassesEvent);
  }

  Future<void> onAllEvent(event, emit) async {
    print('All Event Dispatched!');
    emit(SearchNavbarAllState());
  }

  Future<void> onEducatorsEvent(event, emit) async {
    print('Educators Event Dispatched!');
    emit(SearchNavbarEducatorsState());
  }

  Future<void> onStudentsEvent(event, emit) async {
    print('Students Event Dispatched!');
    emit(SearchNavbarStudentsState());
  }

  Future<void> onClassesEvent(event, emit) async {
    print('Classes Event Dispatched!');
    emit(SearchNavbarClassesState());
  }
}