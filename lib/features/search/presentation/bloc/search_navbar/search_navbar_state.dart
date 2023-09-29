part of 'search_navbar_bloc.dart';

abstract class SearchNavbarState {
  // The title would either be 
  // - All, Educators, Students, Classes
  final String title;

  SearchNavbarState(this.title);
}

class SearchNavbarAllState extends SearchNavbarState {
  SearchNavbarAllState() : super('All');
}

class SearchNavbarEducatorsState extends SearchNavbarState {
  SearchNavbarEducatorsState() : super('Educators');
}

class SearchNavbarStudentsState extends SearchNavbarState {
  SearchNavbarStudentsState() : super('Students');
}

class SearchNavbarClassesState extends SearchNavbarState {
  SearchNavbarClassesState() : super('Classes');
}