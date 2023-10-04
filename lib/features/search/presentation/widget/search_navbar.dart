import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neocloud_mobile/components/texts.dart';
import 'package:neocloud_mobile/constraints.dart';
import 'package:neocloud_mobile/features/search/presentation/bloc/search_navbar/search_navbar_bloc.dart';

class SearchScreenNavbar extends StatelessWidget {
  const SearchScreenNavbar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchNavbarBloc, SearchNavbarState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  // All
                  GestureDetector(
                    onTap: () => _onPressNavbarItem(
                        context: context, event: SearchNavbarAllEvent()),
                    child: _buildNavItem(
                        context: context,
                        state: SearchNavbarAllState(),
                        isSelected: state is SearchNavbarAllState),
                  ),

                  // Educators
                  GestureDetector(
                    onTap: () => _onPressNavbarItem(
                        context: context, event: SearchNavbarEducatorsEvent()),
                    child: _buildNavItem(
                        context: context,
                        state: SearchNavbarEducatorsState(),
                        isSelected: state is SearchNavbarEducatorsState),
                  ),

                  // Students
                  GestureDetector(
                    onTap: () => _onPressNavbarItem(
                        context: context, event: SearchNavbarStudentsEvent()),
                    child: _buildNavItem(
                        context: context,
                        state: SearchNavbarStudentsState(),
                        isSelected: state is SearchNavbarStudentsState),
                  ),

                  // Classes
                  GestureDetector(
                    onTap: () => _onPressNavbarItem(
                        context: context, event: SearchNavbarClassesEvent()),
                    child: _buildNavItem(
                        context: context,
                        state: SearchNavbarClassesState(),
                        isSelected: state is SearchNavbarClassesState),
                  ),
                ],
              ),
            ),
            Divider(color: Theme.of(context).canvasColor.withOpacity(.3)),
          ],
        );
      },
    );
  }

  Container _buildNavItem(
      {required BuildContext context,
      required SearchNavbarState state,
      required bool isSelected}) {
    return Container(
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: 10),
      padding: state is SearchNavbarAllState
          ? const EdgeInsets.fromLTRB(40, 10, 18, 10)
          : const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: TextMedium(
        title: state.title,
        color: isSelected
            ? Theme.of(context).canvasColor.withOpacity(.9)
            : Theme.of(context).canvasColor.withOpacity(.5),
        weight: isSelected ? FontWeight.w600 : FontWeight.w500,
      ),
    );
  }

  _onPressNavbarItem({
    required BuildContext context,
    required SearchNavbarEvent event,
  }) {
    return BlocProvider.of<SearchNavbarBloc>(context).add(event);
  }
}
