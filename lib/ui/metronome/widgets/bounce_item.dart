import 'package:flutter/material.dart';

class BounceItem extends StatelessWidget {
  final bool isActive;
  final bool isHeavyHit;

  const BounceItem({
    super.key,
    required this.isActive,
    required this.isHeavyHit,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Text("")),
        Container(
          height: isHeavyHit ? 200 : 100,
          width: 50,
          color: isActive ? Colors.black : Colors.white,
        ),
        SizedBox.fromSize(
          size: Size(40, 50),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(child: Image.asset("assets/images/二分音符.png")),
          ),
        ),
      ],
    );
  }
}
