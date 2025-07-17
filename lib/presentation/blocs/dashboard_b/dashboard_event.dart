part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent {
  final int pageIndex;

  const DashboardEvent({required this.pageIndex});
}

class DashboardPageChangedEvent extends DashboardEvent {
  const DashboardPageChangedEvent({
    required super.pageIndex,
  });
}
