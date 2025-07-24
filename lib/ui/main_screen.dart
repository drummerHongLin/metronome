import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/configs/default.dart';
import 'package:flutter_metronome/service/audio/audio.dart';
import 'package:flutter_metronome/ui/buttons/buttone_sector.dart';
import 'package:flutter_metronome/ui/drawer/custom_drawer.dart';
import 'package:flutter_metronome/ui/metronome/metronome_sector.dart';
import 'package:flutter_metronome/ui/modifier/modifier_sector.dart';
import 'package:flutter_metronome/ui/overlay/custom_overlay.dart';
import 'package:flutter_metronome/ui/selector/selector_sector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with TickerProviderStateMixin {
  late AnimationController beatController;
  late AnimationController lottieController;

  int currentBeat = 0;

  final GlobalKey containerKey = GlobalKey();

  late Audio audio;

  @override
  void initState() {
    super.initState();
    beatController = AnimationController(vsync: this);
    lottieController = AnimationController(vsync: this);
    audio = Audio(
      bpm: DefaultData.bpm,
      beatNum: DefaultData.beatNum,
      beatNote: DefaultData.beatNote,
      referenceBeat: DefaultData.referenceBeat,
      beatTypes: [BeatType.A, BeatType.A, BeatType.A, BeatType.A],
    );
    beatController.duration = Duration(
      milliseconds: audio.duration * audio.beatNum,
    );
    lottieController.duration = Duration(milliseconds: audio.duration * 2);
  }

  @override
  void dispose() {
    beatController.dispose();
    lottieController.dispose();
    audio.dispose();
    super.dispose();
  }

  void resetPlayer() {
    audio.resetPlayer(
      DefaultData.bpm,
      DefaultData.beatNum,
      DefaultData.beatNote,
      DefaultData.referenceBeat,
      [BeatType.A, BeatType.A, BeatType.A, BeatType.A],
    );
    beatController.duration = Duration(
      milliseconds: audio.duration * audio.beatNum,
    );
    lottieController.duration = Duration(milliseconds: audio.duration * 2);
    beatController.reset();
    lottieController.reset();
  }

  showReferenceSelector(BuildContext innercontext) async {
    beforeChange();

    final rst = await Navigator.push(
      context,
      CustomOverlay.buildReferenSelectorPageRoute(
        innercontext,
        audio.referenceBeat.index,
      ),
    );

    audio.referenceBeat = ReferenceBeat.values[rst!];
    await afterChange();
  }

  showSubBeatSelector(BuildContext innercontext, int i) async {
    beforeChange();
    final subBeatToSelect = audio.beatTypes[i];
    final rst = await Navigator.push(
      context,
      CustomOverlay.buildSubBeatSelectorPageRoute(
        innercontext,
        subBeatToSelect,
      ),
    );

    audio.setBeatType(i, BeatType.values[rst!]);
    await afterChange();
  }

  showBpmSelectInput(BuildContext innnerContext) async {
    beforeChange();
    final rst = await Navigator.push(
      context,
      CustomOverlay.buildBpmInputPageRoute(innnerContext, audio.bpm),
    );
    audio.bpm = rst!;
    await afterChange();
  }

  showBeatSelector(BuildContext innnerContext) async {
    beforeChange();
    final rst = await Navigator.push(
      context,
      CustomOverlay.buildBeatSelectorPageRoute(
        innnerContext,
        audio.beatNum,
        audio.beatNote,
      ),
    );

    audio.beatNum = DefaultData.beatNumChoices[rst!.$1];
    audio.beatNote = DefaultData.beatNoteChoices[rst.$2];
    await afterChange();
  }

  Future<void> afterChange() async {
    if (!audio.isChange && audio.isPlaying) {
      play();
    } else if (audio.isChange) {
      await audio.changePlayer();
      beatController.duration = Duration(
        milliseconds: audio.duration * audio.beatNum,
      );
      lottieController.duration = Duration(milliseconds: audio.duration * 2);
      beatController.reset();
      lottieController.reset();
    }
  }

  void beforeChange() {
    audio.pauseOnSelect();
    beatController.stop();
    lottieController.stop();
  }

  void showSnackBar(String content) {
    final snackBar = SnackBar(content: Text(content));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // 页面按键play控制 -> 播放器播放和节拍controller
  void play() {
    audio.play();
    beatController.repeat();
    lottieController.repeat();
  }

  void pause() {
    audio.pause();
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
      ),
      drawer: CustomDrawer(),
      body: ListenableBuilder(
        listenable: audio,
        builder: (BuildContext context, Widget? child) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SelectorSector(
                  bpm: audio.bpm,
                  beatNum: audio.beatNum,
                  beatNote: audio.beatNote,
                  referenceBeat: audio.referenceBeat,
                  showReferenceSelector: showReferenceSelector,
                  showBpmInput: showBpmSelectInput,
                  showBeatSelector: showBeatSelector,
                ),
                MetronomeBody(
                  beatController: beatController,
                  lottieController: lottieController,
                  beatNum: audio.beatNum,
                ),
                ModifierSector(
                  bpm: audio.bpm,
                  onChangeStart: (v) {
                    beforeChange();
                    audio.lastBpm = v;
                  },
                  onChangeEnd: (v) {
                    audio.compareBpmAfterSlider();
                    afterChange();
                  },
                  onChanged: audio.setBpmBySlider,
                  beatTypes: audio.beatTypes,
                  showSelector: showSubBeatSelector,
                ),
                ButtoneSector(
                  onPlayPressed: () {
                    audio.isPlaying ? pause() : play();
                  },
                  onResetPressed: () {
                    resetPlayer();
                  },
                  playing: audio.isPlaying,
                  initialized: audio.isInitialized,
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
