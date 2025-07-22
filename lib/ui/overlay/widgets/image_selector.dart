import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/overlay/widgets/custom_selector.dart';

class ImageSelector extends StatefulWidget {
  final Offset position;
  final double width;
  final double height;
  final List<String> source;
  final int initialIndex;

  const ImageSelector({
    super.key,
    required this.position,
    required this.width,
    required this.height,
    required this.source,
    required this.initialIndex,
  });

  @override
  State<ImageSelector> createState() => _ImageSelectorState();
}

class _ImageSelectorState extends State<ImageSelector> {
  late int selectedIndex;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialIndex;
    timer = Timer(Duration(seconds: 2), popWithResult);
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void changeSelectedIndex(int v) {
    timer?.cancel();
    timer = Timer(Duration(seconds: 2), popWithResult);
    setState(() {
      selectedIndex = v;
    });
  }

  void popWithResult() {
    timer?.cancel();
    Navigator.pop(context, selectedIndex);
  }

  Widget builder(ctx, i) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Image.asset(
          widget.source[i],
          width: widget.width,
          height: widget.height,
          fit: BoxFit.scaleDown,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final left = widget.position.dx - 5;
    final top = widget.position.dy - widget.height - 15;
    return GestureDetector(
      onTap: popWithResult,
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children:[ CustomSelector(
          builder: builder,
          initialIndex: widget.initialIndex,
          itemCount: widget.source.length,
          onIndexChanged: changeSelectedIndex,
          left: left,
          top: top,
          height: (widget.height + 10) * 3,
          width: widget.width + 10,
          itemExtent: widget.width + 10,
        ),]
      ),
    );
  }
}
