import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomInput extends StatefulWidget {
  final int bpm;

  final double? left;
  final double? top;
  final double? right;
  final double? bottom;

  const CustomInput({
    super.key,
    required this.bpm,
    this.left,
    this.top,
    this.right,
    this.bottom,
  });

  @override
  State<CustomInput> createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? timer;

  late int currentBpm;

  @override
  void initState() {
    super.initState();
    currentBpm = widget.bpm;
    _controller.text = currentBpm.toString();
    timer = Timer(Duration(seconds: 2), popWithResult);
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    timer?.cancel();
    super.dispose();
  }

  void _onvalueChange(int value, {bool? isCommiteed}) {
    setState(() {
      currentBpm = value;
      _controller.text = currentBpm.toString();
    });
    if (isCommiteed == true) {
      popWithResult();
    } else {
      timer?.cancel();
      timer = Timer(Duration(seconds: 2), popWithResult);
    }
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      timer?.cancel();
    } else {
      timer = Timer(Duration(seconds: 2), popWithResult);
    }
  }

  void popWithResult() {
    timer?.cancel();
    Navigator.pop(context, currentBpm);
  }

  void _increment() {
    final rst = min(currentBpm + 1, 180);
    _onvalueChange(rst);
  }

  void _decrement() {
    final rst = max(currentBpm - 1, 30);
    _onvalueChange(rst);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: popWithResult,
      behavior: HitTestBehavior.opaque,
      child: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Positioned(
              left: widget.left,
              top: widget.top,
              right: widget.right,
              bottom: widget.bottom,
              child: Card(
                child: Padding(
                  padding: EdgeInsetsGeometry.all(5),
                  child: SizedBox(
                    width: 120,
                    height: 70,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            focusNode: _focusNode,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.displayLarge,
                            onEditingComplete: () {
                              final rst = int.tryParse(_controller.text);
                              if (rst != null && rst >= 30 && rst <= 180) {
                                _onvalueChange(rst, isCommiteed: true);
                              } else {
                                _controller.text = widget.bpm.toString();
                              }
                            },
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _ArrowButton(
                              icon: Icons.keyboard_arrow_up,
                              onPressed: _increment,
                            ),
                            _ArrowButton(
                              icon: Icons.keyboard_arrow_down,
                              onPressed: _decrement,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ArrowButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(icon, size: 18),
        padding: EdgeInsets.zero,
        splashRadius: 12,
      ),
    );
  }
}
