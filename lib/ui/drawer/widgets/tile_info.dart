import 'package:flutter/material.dart';

class TileInfo extends StatelessWidget {
  final Widget child;
  final String title;

  const TileInfo({super.key, required this.title, required this.child});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;

    return Center(
      child: SizedBox(
        height: mediaSize.height * .5,
        width: mediaSize.width * 0.75,
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(child: child),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
