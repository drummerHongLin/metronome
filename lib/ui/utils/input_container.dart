import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {

  final Widget child;
  final FocusNode focusNode;
  final double height;
  final double width;

  const InputContainer({super.key, required this.focusNode, required this.height, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return         Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceDim,
            /*border: Border.all(
              color: Theme.of(context).colorScheme.outline,
              width: 1,
            ), */
            borderRadius: BorderRadius.circular(4),
            boxShadow: focusNode.hasFocus
                ? [
                    BoxShadow(
                      color: Theme.of(context).colorScheme.outline,
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ]
                : [],
          ),
          child: child,);
  }

  
}