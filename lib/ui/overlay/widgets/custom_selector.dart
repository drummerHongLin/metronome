import 'package:flutter/cupertino.dart';
import 'package:wheel_picker/wheel_picker.dart';

class CustomSelector extends StatelessWidget {
  final Widget Function(BuildContext, int) builder;
  final int initialIndex;
  final int itemCount;
  final Function(int) onIndexChanged;
  final double height;
  final double width;
  final double itemExtent;
  final double? left;
  final  double? top;
  final double? right;
  final double? bottom;
  final bool isVertical = true;

  const CustomSelector({
    super.key,
    required this.builder,
    required this.initialIndex,
    required this.itemCount,
    required this.onIndexChanged,
    required this.height,
    required this.width,
    required this.itemExtent,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      right: right,
      bottom: bottom,
      child: SizedBox(
        height: height,
        width: width,
        child: WheelPicker(
          scrollDirection: isVertical ? Axis.vertical : Axis.horizontal,
          builder: builder,
          looping: false,
          itemCount: itemCount,
          initialIndex: initialIndex,
          onIndexChanged: (i,it)=>onIndexChanged(i),
          style: WheelPickerStyle(
            itemExtent: itemExtent,
            squeeze: 1.25,
            diameterRatio: 0.8,
            surroundingOpacity: .25,
            magnification: 1.2,
          ),
        ),
      ),
    );
  }
}
