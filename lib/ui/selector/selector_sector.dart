import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/ui/selector/widgets/selector_container.dart';

class SelectorSector extends StatelessWidget {
  const SelectorSector({
    super.key,
    required this.bpm,
    required this.beatNum,
    required this.beatNote,
    required this.referenceBeat,
    required this.showReferenceSelector, required this.showBpmInput, required this.showBeatSelector,
  });

  final int bpm;
  final int beatNum;
  final int beatNote;
  final ReferenceBeat referenceBeat;
  final Function(BuildContext) showReferenceSelector;
  final Function(BuildContext) showBpmInput;
  final Function(BuildContext) showBeatSelector;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SelectorContainer(
          size: Size(82, 82),
          label: "音符",
          showSelector: showReferenceSelector,
          child: Image.asset(
            referenceBeat.path,
            width: 40,
            height: 40,
            fit: BoxFit.scaleDown,
          ),
        ),
        SelectorContainer(
          size: Size(122, 122),
          label: "BPM",
          showSelector: showBpmInput,
          child: DecoratedBox(decoration: BoxDecoration(
            border: BoxBorder.fromLTRB(bottom: BorderSide())
          ),
            child: Text("$bpm", style: Theme.of(context).textTheme.displayLarge)),
        ),
        SelectorContainer(
          size: Size(100, 82),
          label: "节奏型",
          showSelector: showBeatSelector,
          child: Text(
            "$beatNum/$beatNote",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
      ],
    );
  }
}
