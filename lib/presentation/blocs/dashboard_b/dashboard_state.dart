// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

@immutable
class DashboardState {
  int selectedPageIndex;
  PageController pageController;
  DashboardState({
    required this.selectedPageIndex,
    required this.pageController,
  });

  DashboardState copyWith({
    int? selectedPageIndex,
    PageController? pageController,
  }) {
    return DashboardState(
      selectedPageIndex: selectedPageIndex ?? this.selectedPageIndex,
      pageController: pageController ?? this.pageController,
    );
  }
}
