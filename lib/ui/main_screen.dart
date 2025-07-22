import 'dart:async';

import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/configs/default.dart';
import 'package:flutter_metronome/service/audio/audio.dart';
import 'package:flutter_metronome/ui/buttons/buttone_sector.dart';
import 'package:flutter_metronome/ui/metronome/metronome_sector.dart';
import 'package:flutter_metronome/ui/modifier/modifier_sector.dart';
import 'package:flutter_metronome/ui/overlay/custom_overlay.dart';
import 'package:flutter_metronome/ui/selector/selector_sector.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController beatController;

  int currentBeat = 0;

  final GlobalKey containerKey = GlobalKey();

  late Audio audio;

  @override
  void initState() {
    super.initState();
    beatController = AnimationController(vsync: this);
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
  }

  @override
  void dispose() {
    beatController.dispose();
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
    beatController.reset();
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
      beatController.reset();
    }
  }

  void beforeChange() {
    audio.pauseOnSelect();
    beatController.stop();
  }

  void showSnackBar(String content) {
    final snackBar = SnackBar(content: Text(content));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // 页面按键play控制 -> 播放器播放和节拍controller
  void play() {
    audio.play();
    beatController.repeat();
  }

  void pause() {
    audio.pause();
    beatController.stop();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
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
              MetronomeBody(controller: beatController, beatNum: audio.beatNum),
              ModifierSector(
                bpm: audio.bpm,
                onChangeStart: (v) {
                  beforeChange();
                  audio.lastBpm = v;
                },
                onChangeEnd: (v) {
                  EasyDebounce.debounce(
                    'my-debouncer', // <-- An ID for this particular debouncer
                    Duration(milliseconds: 1000), // <-- The debounce duration
                    () {
                      audio.compareBpmAfterSlider();
                      afterChange();
                    }, // <-- The target method
                  );
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
              ),
            ],
          ),
        );
      },
    );
  }
}
