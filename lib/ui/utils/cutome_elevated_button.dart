import 'package:flutter/material.dart';

class CustomeElevatedButton extends StatelessWidget {
  final Color? color;
  final VoidCallback onTap;

  final Widget child;

  const CustomeElevatedButton({
    super.key,
    this.color,
    required this.onTap,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color ?? Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.primary.withAlpha(56),
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}
