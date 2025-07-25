import 'package:flutter/material.dart';

class PopUpRouteWrapper<T> extends PopupRoute<T> {
  final Widget child;

  PopUpRouteWrapper({
    super.settings,
    super.requestFocus,
    super.filter,
    super.traversalEdgeBehavior,
    super.directionalTraversalEdgeBehavior,
    required this.child,
  });

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => null;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return child;
  }

  @override
  Duration get transitionDuration => Duration(milliseconds: 100);
}
