import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/overlay/widgets/custom_selector.dart';

class TowLineSelector extends StatefulWidget {
  final double height;
  final double width;
  final Offset position_1;
  final Offset position_2;
  final List sources_1;
  final List sources_2;
  final int initialIndex_1;
  final int initialIndex_2;

  const TowLineSelector({
    super.key,
    required this.height,
    required this.width,
    required this.position_1,
    required this.position_2,
    required this.sources_1,
    required this.sources_2,
    required this.initialIndex_1,
    required this.initialIndex_2,
  });

  @override
  State<TowLineSelector> createState() => _TowLineSelectorState();
}

class _TowLineSelectorState extends State<TowLineSelector> {
  late int selectedIndex_1;
  late int selectedIndex_2;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    selectedIndex_1 = widget.initialIndex_1;
    selectedIndex_2 = widget.initialIndex_2;
    timer = Timer(Duration(seconds: 2), popWithResult);
  }

  void changeSelectedIndex(int v, int vi) {
    timer?.cancel();
    timer = Timer(Duration(seconds: 2), popWithResult);
    setState(() {
      if (vi == 1) {
        selectedIndex_1 = v;
      } else {
        selectedIndex_2 = v;
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  void popWithResult() {
     timer?.cancel();
    Navigator.pop(context, (selectedIndex_1, selectedIndex_2));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:popWithResult,
    behavior: HitTestBehavior.opaque,
      child: Container(
           color: Colors.transparent,
        child: Stack(
          children: [
            CustomSelector(
              builder: (ctx, i) {
                return Text(
                  "${widget.sources_1[i]}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              initialIndex: selectedIndex_1,
              itemCount: widget.sources_1.length,
              onIndexChanged: (i) => changeSelectedIndex(i, 1),
              height: widget.height,
              width: widget.width,
              itemExtent: widget.width,
              top: widget.position_1.dy - widget.width,
              left: widget.position_1.dx - widget.width,
            ),
            CustomSelector(
              builder: (ctx, i) {
                return Text(
                  "${widget.sources_2[i]}",
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
              initialIndex: selectedIndex_2,
              itemCount: widget.sources_2.length,
              onIndexChanged: (i) => changeSelectedIndex(i, 2),
              height: widget.height,
              width: widget.width,
              itemExtent: widget.width,
              top: widget.position_2.dy - widget.width,
              left: widget.position_2.dx,
            ),
          ],
        ),
      ),
    );
  }
}
