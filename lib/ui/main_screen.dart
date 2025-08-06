import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/configs/default.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:flutter_metronome/ui/buttons/buttone_sector.dart';
import 'package:flutter_metronome/ui/drawer/custom_drawer.dart';
import 'package:flutter_metronome/ui/metronome/metronome_sector.dart';
import 'package:flutter_metronome/ui/modifier/modifier_sector.dart';
import 'package:flutter_metronome/ui/overlay/custom_overlay.dart';
import 'package:flutter_metronome/ui/selector/selector_sector.dart';
import 'package:flutter_metronome/ui/timer/timer_component.dart';
import 'package:flutter_metronome/ui/timer/timer_setter.dart';
import 'package:flutter_metronome/ui/utils/popuprouter_wrapper.dart';

class MainScreen extends StatefulWidget {
  final MainScreenViewModel viewModel;
  const MainScreen({super.key, required this.viewModel});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController beatController;
  late AnimationController lottieController;

  int currentBeat = 0;

  final GlobalKey containerKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    beatController = AnimationController(vsync: this);
    lottieController = AnimationController(vsync: this);

    beatController.duration = Duration(
      milliseconds: widget.viewModel.duration * widget.viewModel.beatNum,
    );
    lottieController.duration = Duration(
      milliseconds: widget.viewModel.duration * 2,
    );
    widget.viewModel.runningState.addListener(timingOut);
  }

  @override
  void dispose() {
    beatController.dispose();
    lottieController.dispose();
    widget.viewModel.runningState.removeListener(timingOut);
    super.dispose();
  }

  void resetPlayer() {
    widget.viewModel.resetPlayer(
      DefaultData.bpm,
      DefaultData.beatNum,
      DefaultData.beatNote,
      DefaultData.referenceBeat,
      [BeatType.A, BeatType.A, BeatType.A, BeatType.A],
    );
    beatController.duration = Duration(
      milliseconds: widget.viewModel.duration * widget.viewModel.beatNum,
    );
    lottieController.duration = Duration(
      milliseconds: widget.viewModel.duration * 2,
    );
    beatController.reset();
    lottieController.reset();
  }

  showReferenceSelector(BuildContext innercontext) async {
    beforeChange();

    final rst = await Navigator.push(
      context,
      CustomOverlay.buildReferenSelectorPageRoute(
        innercontext,
        widget.viewModel.referenceBeat.index,
      ),
    );

    widget.viewModel.referenceBeat = ReferenceBeat.values[rst!];
    await afterChange();
  }

  showSubBeatSelector(BuildContext innercontext, int i) async {
    beforeChange();
    final subBeatToSelect = widget.viewModel.beatTypes[i];
    final rst = await Navigator.push(
      context,
      CustomOverlay.buildSubBeatSelectorPageRoute(
        innercontext,
        subBeatToSelect,
      ),
    );

    widget.viewModel.setBeatType(i, BeatType.values[rst!]);
    await afterChange();
  }

  showBpmSelectInput(BuildContext innnerContext) async {
    beforeChange();
    final rst = await Navigator.push(
      context,
      CustomOverlay.buildBpmInputPageRoute(innnerContext, widget.viewModel.bpm),
    );
    widget.viewModel.bpm = rst!;
    await afterChange();
  }

  showBeatSelector(BuildContext innnerContext) async {
    beforeChange();
    final rst = await Navigator.push(
      context,
      CustomOverlay.buildBeatSelectorPageRoute(
        innnerContext,
        widget.viewModel.beatNum,
        widget.viewModel.beatNote,
      ),
    );

    widget.viewModel.beatNum = DefaultData.beatNumChoices[rst!.$1];
    widget.viewModel.beatNote = DefaultData.beatNoteChoices[rst.$2];
    await afterChange();
  }

  showTimerSetter() async {
    beforeChange();
    final rst = await Navigator.push(
      context,
      PopUpRouteWrapper<(int, int)>(child: TimerSetter()),
    );
    if (rst != null) {
      widget.viewModel.setTRemind(rst.$1, rst.$2);
    }
    await afterChange();
  }

  timingOut(){
    if(widget.viewModel.runningState.value == 0) pause();
  }

  Future<void> afterChange() async {
    if (!widget.viewModel.isChange && widget.viewModel.isPlaying) {
      play();
    } else if (widget.viewModel.isChange) {
      await widget.viewModel.changePlayer();
      beatController.duration = Duration(
        milliseconds: widget.viewModel.duration * widget.viewModel.beatNum,
      );
      lottieController.duration = Duration(
        milliseconds: widget.viewModel.duration * 2,
      );
      beatController.reset();
      lottieController.reset();
    }
  }

  void beforeChange() {
    widget.viewModel.pauseOnSelect();
    beatController.stop();
    lottieController.stop();
  }

  void showSnackBar(String content) {
    final snackBar = SnackBar(content: Text(content));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // 页面按键play控制 -> 播放器播放和节拍controller
  void play() {
    widget.viewModel.play();
    beatController.repeat();
    lottieController.repeat();
  }

  void pause() {
    widget.viewModel.pause();
    beatController.stop();
    lottieController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (ctx) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(ctx).openDrawer();
              },
            );
          },
        ),
        actions: [
          TimerComponent(
            runningState: widget.viewModel.runningState,
            tRemind: widget.viewModel.tRemind,
            onSetTimer: showTimerSetter,
            onCloseTimer: widget.viewModel.endTimer,
          ),
        ],
      ),
      drawer: CustomDrawer(),
      body: ListenableBuilder(
        listenable: widget.viewModel,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectorSector(
                  bpm: widget.viewModel.bpm,
                  beatNum: widget.viewModel.beatNum,
                  beatNote: widget.viewModel.beatNote,
                  referenceBeat: widget.viewModel.referenceBeat,
                  showReferenceSelector: showReferenceSelector,
                  showBpmInput: showBpmSelectInput,
                  showBeatSelector: showBeatSelector,
                ),
                MetronomeBody(
                  beatController: beatController,
                  lottieController: lottieController,
                  beatNum: widget.viewModel.beatNum,
                ),
                ModifierSector(
                  bpm: widget.viewModel.bpm,
                  onChangeStart: (v) {
                    beforeChange();
                    widget.viewModel.lastBpm = v;
                  },
                  onChangeEnd: (v) {
                    widget.viewModel.compareBpmAfterSlider();
                    afterChange();
                  },
                  onChanged: widget.viewModel.setBpmBySlider,
                  beatTypes: widget.viewModel.beatTypes,
                  showSelector: showSubBeatSelector,
                ),
                Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {},
                      label: Text("新建练习节拍"),
                      icon: Icon(Icons.music_note),
                    ),
                    Spacer(),
                    InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Padding(
                          padding: EdgeInsetsGeometry.symmetric(
                            horizontal: 5,
                            vertical: 2,
                          ),
                          child: Text(
                            "保存",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                  ],
                ),
                ButtoneSector(
                  onPlayPressed: () {
                    widget.viewModel.isPlaying ? pause() : play();
                  },
                  onResetPressed: () {
                    resetPlayer();
                  },
                  playing: widget.viewModel.isPlaying,
                  initialized: widget.viewModel.isInitialized,
                ),
              ],
            ),
          );
        },
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
