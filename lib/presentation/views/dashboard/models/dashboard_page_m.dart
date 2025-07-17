// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'bottom_navbar_m.dart';

class DashboardPageM {
  bool isActive;
  String pageId;
  Widget page;
  BottomNavbarM bottomNavbar;
  DashboardPageM({required this.isActive, required this.pageId, required this.page, required this.bottomNavbar});

  DashboardPageM copyWith({bool? isActive, String? pageId, Widget? page, BottomNavbarM? bottomNavbar}) {
    return DashboardPageM(
      isActive: isActive ?? this.isActive,
      pageId: pageId ?? this.pageId,
      page: page ?? this.page,
      bottomNavbar: bottomNavbar ?? this.bottomNavbar,
    );
  }
}
