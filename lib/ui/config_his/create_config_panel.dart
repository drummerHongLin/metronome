import 'package:flutter/material.dart';
import 'package:flutter_metronome/repo/model/player_config.dart';
import 'package:flutter_metronome/ui/utils/input_container.dart';
import 'package:intl/intl.dart';

class CreateConfigPanel extends StatefulWidget {
  final PlayerConfigInfo configInfo;

  const CreateConfigPanel({super.key, required this.configInfo});

  @override
  State<CreateConfigPanel> createState() => _CreateConfigPanelState();
}

class _CreateConfigPanelState extends State<CreateConfigPanel> {
  late FocusNode focusNode;
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    controller = TextEditingController(
      text:
          "新建节拍配置 - ${DateFormat("yyyy-MM-dd hh:mm:dd").format(DateTime.now())}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                Center(
                  child: Text(
                    "新建节拍配置",
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text("节拍配置名称: "),
                InputContainer(
                  focusNode: focusNode,
                  height: 50,
                  width: double.infinity,
                  child: TextField(
                    controller: controller,
                    focusNode: focusNode,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                Text("当前参数："),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Theme.of(
                      context,
                    ).colorScheme.surfaceDim.withAlpha(125),
                  ),
                  padding: EdgeInsets.all(5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("BPM: ${widget.configInfo.bpm}"),
                          Spacer(),
                          Text(
                            "节拍型: ${widget.configInfo.beatNum}/${widget.configInfo.beatNote}",
                          ),
                          Spacer(),
                          Text("节拍模式: "),
                          Image.asset(
                            widget.configInfo.referenceBeat.path,
                            height: 14,
                            fit: BoxFit.scaleDown,
                          ),
                        ],
                      ),
                      Text("细分节拍: "),
                      SizedBox(
                        height: 30,
                        width: double.infinity,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.configInfo.subBeats.length,
                          itemBuilder: (ctx, idx) {
                            return Image.asset(
                              widget.configInfo.subBeats[idx].path,
                              height: 25,
                              width: 25,
                              fit: BoxFit.scaleDown,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 10,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text("取消"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, controller.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        overlayColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      child: Text(
                        "保存",
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
      ),
    );
  }
}
