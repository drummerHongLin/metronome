import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MetronomeBody extends StatelessWidget {
  final Animation<double> beatController;
  final Animation<double> lottieController;
  final int beatNum;

  const MetronomeBody({
    super.key,
    required this.beatController,
    required this.beatNum,
    required this.lottieController,
  });

  @override
  Widget build(BuildContext context) {
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    late String lottieFile;
    if (brightness == Brightness.light) {
      lottieFile = "assets/lottie/metronome_light_theme.json";
    } else {
      lottieFile = "assets/lottie/metronome_dark_theme.json";
    }

    return Expanded(
      child: Column(
          children: [
            Expanded(
              child: Center(
                child: Lottie.asset(lottieFile, controller: lottieController),
              ),
            ),
            SizedBox(
              height: 52,
              child: _DotNoteList(controller: beatController, beatNum: beatNum)),
          ],
        ),
    );
  }
}

class _DotNoteList extends AnimatedWidget {
  final Animation<double> controller;
  final int beatNum;

  const _DotNoteList({required this.controller, required this.beatNum})
    : super(listenable: controller);

  int get _activeIndex {
    if (controller.value == 0) return -1;
    final double progress = controller.value;
    return (progress * beatNum).floor() % beatNum;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: 
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (int i = 0; i < beatNum; i++)
            Padding(
              padding:  EdgeInsets.symmetric(horizontal:  8.0-max((beatNum-8)/2,0),vertical: 8),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                width: 20-max((beatNum-8),0),
                height: 20-max((beatNum-8),0),
                decoration: BoxDecoration(
                  color:
                      i == _activeIndex
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(context).colorScheme.surfaceDim,
                  shape: BoxShape.circle,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
