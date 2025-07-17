import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc()
      : super(DashboardState(
            selectedPageIndex: 0,
            pageController: PageController(initialPage: 0))) {
    onPageMoved();
  }

  void onPageMoved() {
    return on<DashboardPageChangedEvent>((event, emit) {
      state.pageController.jumpToPage(event.pageIndex);
      emit(state.copyWith(selectedPageIndex: event.pageIndex));
    });
  }
}
