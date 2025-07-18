import 'package:flutter/material.dart';

class SelectorContainer extends StatelessWidget {
  final Widget child;
  final Size size;
  final String label;
  final Function(BuildContext) showSelector;
  const SelectorContainer({
    super.key,
    required this.child,
    required this.size,
    required this.label,
    required this.showSelector,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: SizedBox.fromSize(
        size: size,
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Builder(
                builder: (innerContext) {
                  return GestureDetector(
                    onTap: () => showSelector(innerContext),
                    child: child,
                  );
                },
              ),
              Text(label, style: Theme.of(context).textTheme.labelLarge),
            ],
          ),
        ),
      ),
    );
  }
}
