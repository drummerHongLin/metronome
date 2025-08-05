import 'package:flutter/material.dart';

class ButtoneSector extends StatelessWidget {
  final VoidCallback onPlayPressed;
  final VoidCallback onResetPressed;

  final bool playing;

  final bool initialized;

  const ButtoneSector({
    super.key,
    required this.onPlayPressed,
    required this.onResetPressed,
    required this.playing,
    required this.initialized,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: initialized ? onPlayPressed : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  playing ? "暂停" : "开始",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: initialized ? onResetPressed : null,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "重置",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
