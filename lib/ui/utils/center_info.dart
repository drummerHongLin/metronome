import 'package:flutter/material.dart';

class CenterInfo extends StatelessWidget {
  final Widget child;
  final String title;

  const CenterInfo({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: mediaSize.height * .5,
          maxWidth: mediaSize.width * 0.75,
          minWidth: mediaSize.width * 0.75,
        ),
        child: Card(
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                ),
                Expanded(child: SingleChildScrollView(child: child)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
