import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/configs/default.dart';
import 'package:flutter_metronome/ui/overlay/widgets/custom_input.dart';
import 'package:flutter_metronome/ui/overlay/widgets/image_selector.dart';
import 'package:flutter_metronome/ui/overlay/widgets/tow_line_selector.dart';
import 'package:flutter_metronome/ui/utils/popuprouter_wrapper.dart';

Offset _getPositon(
  BuildContext clickBoxContext, {
  bool? offsetToRight,
  bool? offsetToBottom,
}) {
  RenderBox? renderBox = clickBoxContext.findRenderObject() as RenderBox?;

  if (renderBox == null) throw Exception('点击主体未被渲染');

  final Offset point = Offset(
    offsetToRight == true ? renderBox.size.width : 0,
    offsetToBottom == true ? renderBox.size.height : 0,
  );

  return renderBox.localToGlobal(point);
}

abstract class CustomOverlay {
  static Route<int> buildReferenSelectorPageRoute(
    BuildContext clickBoxContext,
    int initialIndex,
  ) {
    Offset offset = _getPositon(clickBoxContext);

    final referenceBeatSource =
        ReferenceBeat.values.map((e) => e.path).toList();

    return PopUpRouteWrapper(
      child: ImageSelector(
        position: offset,
        width: 40,
        height: 40,
        source: referenceBeatSource,
        initialIndex: initialIndex,
      ),
    );
  }

  static Route<int> buildSubBeatSelectorPageRoute(
    BuildContext clickBoxContext,
    BeatType initialBeat,
  ) {
    Offset offset = _getPositon(clickBoxContext);

    final subBeatSource = BeatType.values.map((e) => e.path).toList();

    return PopUpRouteWrapper(
      child: ImageSelector(
        position: offset,
        width: 40,
        height: 40,
        source: subBeatSource,
        initialIndex: initialBeat.index,
      ),
    );
  }

  static Route<(int, int)> buildBeatSelectorPageRoute(
    BuildContext clickBoxContext,
    int beatNum,
    int beatNote,
  ) {
    Offset leftTop = _getPositon(clickBoxContext);
    Offset rightTop = _getPositon(clickBoxContext, offsetToRight: true);

    final initialIndex_1 = DefaultData.beatNumChoices.indexOf(beatNum);

    final initialIndex_2 = DefaultData.beatNoteChoices.indexOf(beatNote);

    return PopUpRouteWrapper<(int, int)>(
      child: TowLineSelector(
        height: 108,
        width: 36,
        position_1: leftTop,
        position_2: rightTop,
        sources_1: DefaultData.beatNumChoices,
        sources_2: DefaultData.beatNoteChoices,
        initialIndex_1: initialIndex_1,
        initialIndex_2: initialIndex_2,
      ),
    );
  }

  static Route<int> buildBpmInputPageRoute(
    BuildContext clickBoxContext,
    int bpm,
  ) {
    Offset offset = _getPositon(clickBoxContext);
    return PopUpRouteWrapper<int>(
      child: CustomInput(bpm: bpm, left: offset.dx - 35, top: offset.dy - 5),
    );
  }
}

