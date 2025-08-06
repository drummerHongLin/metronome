import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_metronome/ui/utils/arrow_button.dart';
import 'package:flutter_metronome/ui/utils/input_container.dart';

class TimerSetter extends StatefulWidget {
  const TimerSetter({super.key});

  @override
  State<TimerSetter> createState() => _TimerSetterState();
}

class _TimerSetterState extends State<TimerSetter> {
  int m = 0;
  int s = 0;
  late TextEditingController _controllerLeft;
  late FocusNode _focusNodeLeft;
  late TextEditingController _controllerRight;
  late FocusNode _focusNodeRight;

  @override
  void initState() {
    super.initState();
    _controllerLeft = TextEditingController(text: m.toString());
    _focusNodeLeft = FocusNode();
    _controllerRight = TextEditingController(text: m.toString());
    _focusNodeRight = FocusNode();
    _focusNodeLeft.addListener(_handleFocusChange);
    _focusNodeRight.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _controllerLeft.dispose();
    _controllerRight.dispose();
    _focusNodeLeft.dispose();
    _focusNodeRight.dispose();
    _focusNodeLeft.removeListener(_handleFocusChange);
    _focusNodeRight.removeListener(_handleFocusChange);
    super.dispose();
  }

  void _handleFocusChange() {
    setState(() {});
  }

  void _fastSetTime(int u, int v) {
    setState(() {
      _controllerLeft.text = u.toString();
      _controllerRight.text = v.toString();
    });
  }

  void onIncrease(bool minute) {
    late TextEditingController _c;
    if (minute) {
      _c = _controllerLeft;
    } else {
      _c = _controllerRight;
    }

    int v = int.parse(_c.text);
    if (v < 59) {
      setState(() {
        v++;
        _c.text = v.toString();
      });
    }
  }

  void onDecrease(bool minute) {
    late TextEditingController _c;
    if (minute) {
      _c = _controllerLeft;
    } else {
      _c = _controllerRight;
    }
    int v = int.parse(_c.text);
    if (v > 0) {
      setState(() {
        v--;
        _c.text = v.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "设置练习时间",
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  _TimerInput(
                    controller: _controllerLeft,
                    focusNode: _focusNodeLeft,
                    onIncrease: () => onIncrease(true),
                    onDecrease: () => onDecrease(true),
                    title: "分钟",
                  ),
                  _TimerInput(
                    controller: _controllerRight,
                    focusNode: _focusNodeRight,
                    onIncrease: () => onIncrease(false),
                    onDecrease: () => onDecrease(false),
                    title: "秒钟",
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextButton(
                    onPressed: () {
                      _fastSetTime(10, 0);
                    },
                    child: Text("10分钟"),
                  ),
                  TextButton(
                    onPressed: () {
                      _fastSetTime(20, 0);
                    },
                    child: Text("20分钟"),
                  ),
                  TextButton(
                    onPressed: () {
                      _fastSetTime(30, 0);
                    },
                    child: Text("30分钟"),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context,(0,0));
                    },
                    child: Text("取消"),
                  ),
                  ElevatedButton(
                    onPressed: (){
                      final m = int.tryParse(_controllerLeft.text) ?? 0;
                      final s = int.tryParse(_controllerRight.text) ?? 0;
                      Navigator.pop(context,(m,s));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      overlayColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: Text(
                      "确定",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TimerInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final VoidCallback onIncrease;
  final VoidCallback onDecrease;
  final String title;

  const _TimerInput({
    required this.controller,
    required this.focusNode,
    required this.onIncrease,
    required this.onDecrease,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
          InputContainer(focusNode: focusNode, height: 50, width: 100, child:  Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  focusNode: focusNode,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ArrowButton(
                    icon: Icons.keyboard_arrow_up,
                    onPressed: onIncrease,
                  ),
                  ArrowButton(
                    icon: Icons.keyboard_arrow_down,
                    onPressed: onDecrease,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
