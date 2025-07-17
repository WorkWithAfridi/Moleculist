import 'package:flutter/material.dart';

class CustomTransitionPageRoute extends PageRouteBuilder {
  CustomTransitionPageRoute({required this.childWidget})
      : super(
          transitionDuration: const Duration(milliseconds: 150),
          reverseTransitionDuration: const Duration(milliseconds: 150),
          pageBuilder: (context, animation, secondaryAnimation) => childWidget,
        );
  final Widget childWidget;

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final curvedAnimation = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    return SlideTransition(
      position: Tween<Offset>(begin: const Offset(0.8, 0), end: Offset.zero).animate(curvedAnimation),
      child: FadeTransition(
        opacity: curvedAnimation,
        child: childWidget,
      ),
    );
  }
}
