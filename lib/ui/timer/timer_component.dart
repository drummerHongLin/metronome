import 'package:flutter/material.dart';

class TimerComponent extends StatelessWidget {

  final ValueNotifier<int> runningState;
  final ValueNotifier<int> tRemind;
  final VoidCallback onSetTimer;
  final VoidCallback onCloseTimer;

  const TimerComponent({super.key, required this.runningState, required this.tRemind, required this.onSetTimer, required this.onCloseTimer});


  @override
  Widget build(BuildContext context) {
    return           ValueListenableBuilder(
            valueListenable: runningState,
            builder: (ctx, v, child) {
              if (v == 0) return child!;
              return ValueListenableBuilder(
                valueListenable: tRemind,
                builder: (ctx, t, c) {
                  return TextButton.icon(
                    onPressed: onCloseTimer,
                    label: Text("${ (t ~/ 60).toString().padLeft(2,'0') } : ${(t % 60).toString().padLeft(2,'0')}"),
                    icon: Icon(Icons.close),
                  );
                },
              );
            },
            child: TextButton.icon(
              onPressed: onSetTimer,
              label: Text("定时器"),
              icon: Icon(Icons.alarm),
            ),
          );
  }


  
}