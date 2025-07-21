import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/configs/default.dart';
import 'package:flutter_metronome/service/audio/audio.dart';
import 'package:flutter_metronome/ui/buttons/buttone_sector.dart';
import 'package:flutter_metronome/ui/metronome/metronome_sector.dart';
import 'package:flutter_metronome/ui/modifier/modifier_sector.dart';
import 'package:flutter_metronome/ui/selector/selector_sector.dart';
import 'package:flutter_metronome/ui/utils/custom_input.dart';
import 'package:just_audio/just_audio.dart';
import 'package:wheel_picker/wheel_picker.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController beatController;
  int bpm = DefaultData.bpm;
  int beatNum = DefaultData.beatNum;
  int beatNote = DefaultData.beatNote;
  ReferenceBeat referenceBeat = DefaultData.referenceBeat;
  late int duration;
  bool playing = false;
  bool playingBefore = false;
  OverlayEntry? referenceSelectorEntry;
  OverlayEntry? bpmSelectorEntry;
  OverlayEntry? beatNumSelectorEntry;
  OverlayEntry? beatNoteSelectorEntry;
  OverlayEntry? subBeatSelectorEntry;
  Timer? selectTimer;
  bool get isChanged =>
      lastBpm != bpm ||
      lastBeatNum != beatNum ||
      lastBeatNote != beatNote ||
      lastReferenceBeat != referenceBeat ||
      !listEquals(lastBeatTypes, beatTypes);

  bool isFocusing = false;

  int currentBeat = 0;

  int lastBpm = DefaultData.bpm;
  int lastBeatNum = DefaultData.beatNum;
  int lastBeatNote = DefaultData.beatNote;
  ReferenceBeat lastReferenceBeat = DefaultData.referenceBeat;
  List<BeatType> lastBeatTypes = [
    BeatType.A,
    BeatType.A,
    BeatType.A,
    BeatType.A,
  ];

  final GlobalKey containerKey = GlobalKey();

  List<BeatType> beatTypes = [BeatType.A, BeatType.A, BeatType.A, BeatType.A];

  late AudioPlayer player;

  @override
  void initState() {
    super.initState();
    beatController = AnimationController(vsync: this);
    player =  AudioPlayer();
    player.setLoopMode(LoopMode.all);
    initPlayer();
  }

  @override
  void dispose() {
    beatController.dispose();
    player.dispose();
    super.dispose();
  }

  void initBeatParameters() {
    setState(() {
      bpm = DefaultData.bpm;
      beatNum = DefaultData.beatNum;
      beatNote = DefaultData.beatNote;
      referenceBeat = DefaultData.referenceBeat;
      beatTypes = [BeatType.A, BeatType.A, BeatType.A, BeatType.A];
    });
  }




  void initPlayer() async {
    duration = (60 * referenceBeat.value() / (bpm * beatNote) * 1000).toInt();
    beatController.duration = Duration(milliseconds: duration * beatNum);   
    final source = Audio.generatePlayer(beatNum, duration, beatTypes, false);
    await player.setAudioSources(source);
  }

  void pause() {
    playing = false;
    player.pause();
    beatController.stop();
  }

  void play() {
    playing = true;
    player.play();
    beatController.repeat();
  }

  void reset() {
    beatController.reset();
    player.stop();
    initPlayer();
  }

  void setBpm(int v) {
    setState(() {
      bpm = v;
    });
  }

  showReferenceSelector(BuildContext innercontext) {
    beforeSelect();

    final referenceBeatSource =
        ReferenceBeat.values.map((e) => e.path).toList();

    onIndexChanged(index, interactionType) {
      referenceBeat = ReferenceBeat.values[index];
      resetSelectTimer();
    }

    referenceSelectorEntry = OverlayEntry(
      builder:
          (_) => _buildImageSelector(
            innercontext,
            40,
            40,
            referenceBeatSource,
            referenceBeat.index,
            onIndexChanged,
          ),
    );
    Overlay.of(context).insert(referenceSelectorEntry!);
    resetSelectTimer();
  }

  showSubBeatSelector(BuildContext innercontext, int i) {
    beforeSelect();
    final subBeatSource = BeatType.values.map((e) => e.path).toList();
    final subBeatToSelect = beatTypes[i];

    onIndexChanged(index, interactionType) {
      beatTypes[i] = BeatType.values[index];
      resetSelectTimer();
    }

    subBeatSelectorEntry = OverlayEntry(
      builder:
          (_) => _buildImageSelector(
            innercontext,
            40,
            40,
            subBeatSource,
            subBeatToSelect.index,
            onIndexChanged,
          ),
    );
    Overlay.of(context).insert(subBeatSelectorEntry!);
    resetSelectTimer();
  }

  showBpmSelectInput(BuildContext context) {
    beforeSelect();
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) throw Exception('点击主体未被渲染');

    Offset offset = renderBox.localToGlobal(Offset.zero);

    changeBpm(i, isCommitted) {
      setBpm(i);
      if (isCommitted) {
        clearOverlayEntry();
      } else {
        resetSelectTimer();
      }
    }

    changeFocus(b) {
      isFocusing = b;
      if (isFocusing) {
        selectTimer?.cancel();
      } else {
        resetSelectTimer();
      }
    }

    bpmSelectorEntry = OverlayEntry(
      builder:
          (_) => Positioned(
            left: offset.dx - 35,
            top: offset.dy - 5,
            child: CustomInput(
              bpm: bpm,
              changeBpm: changeBpm,
              changeFocus: changeFocus,
            ),
          ),
    );

    Overlay.of(context).insert(bpmSelectorEntry!);
    resetSelectTimer(second: 4);
  }

  showBeatSelector(BuildContext context) {
    beforeSelect();
    final selectors = _buildTwoLineSelector(context);

    beatNumSelectorEntry = OverlayEntry(builder: (context) => selectors.$1);
    beatNoteSelectorEntry = OverlayEntry(builder: (context) => selectors.$2);

    Overlay.of(context).insert(beatNumSelectorEntry!);

    Overlay.of(context).insert(beatNoteSelectorEntry!);
    resetSelectTimer();
  }

  void resetSelectTimer({int? second}) {
    selectTimer?.cancel();
    selectTimer = Timer(Duration(seconds: second ?? 1), clearOverlayEntry);
  }

  void beforeSelect() {
    selectTimer?.cancel();
    clearOverlayEntry();
    playingBefore = playing;
    if (playing) pause();
    lastBpm = bpm;
    lastBeatNum = beatNum;
    lastBeatNote = beatNote;
    lastReferenceBeat = referenceBeat;
    lastBeatTypes = List.from(beatTypes);
  }

  void clearOverlayEntry() {
    referenceSelectorEntry?.remove();
    bpmSelectorEntry?.remove();
    beatNumSelectorEntry?.remove();
    beatNoteSelectorEntry?.remove();
    subBeatSelectorEntry?.remove();

    if (beatTypes.any((b) => b != BeatType.A)) {
      // 如果有细分音符，那么按照n/4拍，基准音符是4分音符来
      if (beatNote != 4 || referenceBeat != ReferenceBeat.quarter_note) {
        beatNote = 4;
        referenceBeat = ReferenceBeat.quarter_note;
        showSnackBar("细分节拍暂只支持n/4节拍型");
      }
    }
    if (beatTypes.length > beatNum) {
      beatTypes = beatTypes.sublist(0, beatNum);
    } else if (beatTypes.length < beatNum) {
      for (int i = beatTypes.length; i < beatNum; i++) {
        beatTypes.add(BeatType.A);
      }
    }

    setState(() {
      referenceSelectorEntry = null;
      bpmSelectorEntry = null;
      beatNumSelectorEntry = null;
      subBeatSelectorEntry = null;
      beatNoteSelectorEntry = null;
      playingBefore = false;
    });

    if (!isChanged && playingBefore) {
      play();
    } else if (isChanged) {
      reset();
    }
  }

  void showSnackBar(String content) {
    final snackBar = SnackBar(content: Text(content));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: clearOverlayEntry,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectorSector(
              bpm: bpm,
              beatNum: beatNum,
              beatNote: beatNote,
              referenceBeat: referenceBeat,
              showReferenceSelector: showReferenceSelector,
              showBpmInput: showBpmSelectInput,
              showBeatSelector: showBeatSelector,
            ),
            MetronomeBody(controller: beatController,beatNum: beatNum,),
            ModifierSector(
              bpm: bpm,
              onChangeStart: pause,
              onChangeEnd: reset,
              onChanged: setBpm,
              beatTypes: beatTypes,
              showSelector: showSubBeatSelector,
            ),
            ButtoneSector(
              onPlayPressed: () {
                playing ? pause() : play();
                setState(() {});
              },
              onResetPressed: () {
                pause();
                initBeatParameters();
                reset();
              },
              playing: playing,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelector({
    required Widget Function(BuildContext, int) builder,
    required int initialIndex,
    required int itemCount,
    required Function(int, WheelPickerInteractionType) onIndexChanged,
    required double height,
    required double width,
    required double itemExtent,
    double? left,
    double? top,
    double? right,
    double? bottom,
    bool isVertical = true,
  }) {
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
          onIndexChanged: onIndexChanged,
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

  Widget _buildImageSelector(
    BuildContext context,
    double width,
    double height,
    List<String> source,
    int initialIndex,
    Function(int, WheelPickerInteractionType) onIndexChanged,
  ) {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) throw Exception('点击主体未被渲染');

    Offset offset = renderBox.localToGlobal(Offset.zero);

    builder(ctx, i) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Image.asset(
            source[i],
            width: width,
            height: height,
            fit: BoxFit.scaleDown,
          ),
        ),
      );
    }

    final itemCount = source.length;

    final left = offset.dx - 5;
    final top = offset.dy - height - 15;

    return _buildSelector(
      builder: builder,
      initialIndex: initialIndex,
      itemCount: itemCount,
      onIndexChanged: onIndexChanged,
      left: left,
      top: top,
      height: (height + 10) * 3,
      width: width + 10,
      itemExtent: width + 10,
    );
  }

  (Widget, Widget) _buildTwoLineSelector(BuildContext context) {
    RenderBox? renderBox = context.findRenderObject() as RenderBox?;

    if (renderBox == null) throw Exception('点击主体未被渲染');

    Offset leftTop = renderBox.localToGlobal(Offset.zero);
    Offset rightTop = renderBox.localToGlobal(Offset(renderBox.size.width, 0));
    final beatNumChoices = DefaultData.beatNumChoices;
    final beatNoteChoices = DefaultData.beatNoteChoices;

    final beatNumSelector = _buildSelector(
      builder: (ctx, i) {
        return Text(
          "${beatNumChoices[i]}",
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
      initialIndex: beatNumChoices.indexOf(beatNum),
      itemCount: beatNumChoices.length,
      onIndexChanged: (i, it) {
        beatNum = beatNumChoices[i];
        resetSelectTimer(second: 2);
      },
      height: 108,
      width: 36,
      itemExtent: 36,
      top: leftTop.dy - 36,
      left: leftTop.dx - 36,
    );

    final beatNoteSelector = _buildSelector(
      builder: (ctx, i) {
        return Text(
          "${beatNoteChoices[i]}",
          style: Theme.of(context).textTheme.headlineMedium,
        );
      },
      initialIndex: beatNoteChoices.indexOf(beatNote),
      itemCount: beatNoteChoices.length,
      onIndexChanged: (i, it) {
        beatNote = beatNoteChoices[i];
        resetSelectTimer(second: 2);
      },
      height: 108,
      width: 36,
      itemExtent: 36,
      top: rightTop.dy - 36,
      left: rightTop.dx,
    );

    return (beatNumSelector, beatNoteSelector);
  }
}
