// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class BottomNavbarM {
  final String title;
  final IconData icon;
  final IconData? iconFilled;
  final int? index;
  final Function? optionalOnTap;

  BottomNavbarM({
    required this.title,
    required this.icon,
    this.iconFilled,
    this.index,
    this.optionalOnTap,
  });

  BottomNavbarM copyWith({
    String? title,
    IconData? icon,
    IconData? iconFilled,
    int? index,
    Function? optionalOnTap,
  }) {
    return BottomNavbarM(
      title: title ?? this.title,
      icon: icon ?? this.icon,
      iconFilled: iconFilled ?? this.iconFilled,
      index: index ?? this.index,
      optionalOnTap: optionalOnTap ?? this.optionalOnTap,
    );
  }
}
