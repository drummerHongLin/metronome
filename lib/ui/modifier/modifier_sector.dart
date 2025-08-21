import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ModifierSector extends StatelessWidget {
  final int bpm;
  final int note;
  final Function(int v) onChangeStart;
  final Function(int v) onChangeEnd;
  final Function(int v) onChanged;
  final List<BeatType> beatTypes;
  final Function(BuildContext, int) showSelector;

  const ModifierSector({
    super.key,
    required this.bpm,
    required this.onChangeStart,
    required this.onChangeEnd,
    required this.onChanged,
    required this.beatTypes,
    required this.showSelector, required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Text(
          "BPM选择",
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: double.maxFinite,
          height: 40,
          child: SfSlider(
            min: 30,
            max: 180,
            value: bpm,
            interval: 1,
            enableTooltip: true,
            onChangeStart: (value) => onChangeStart(value),
            onChangeEnd:
                (value) => {
                  if (value is double) {onChangeEnd(value.toInt())},
                },
            onChanged: (v) {
              if (v is double) {
                onChanged(v.toInt());
              }
            },
          ),
        ),
        Text(
          "细分节拍选择",
          style: Theme.of(
            context,
          ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
  
        SizedBox(
          height: 60,
          width: double.maxFinite,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: beatTypes.length,
            padding: EdgeInsets.symmetric(vertical: 5),
            itemBuilder: (ctx,index){
              return  Card(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: SizedBox(
                      width: 65,
                      height: 50,
                      child: Stack(
                        children: [
                          Positioned( top:4,right: 8,
                            child: Text((index+1).toString(),style: TextStyle(fontSize: 6),)),
                          Center(
                          child: Builder(
                            builder:
                                (innerContext) => GestureDetector(
                                  onTap:
                                    note !=4 ? ()=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("细分音符仅在拍号为 x/4 时有效！"))) : ()=> showSelector(innerContext, index),
                                  onVerticalDragStart:
                                      note !=4 ? (_)=> ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("细分音符仅在拍号为 x/4 时有效！"))) : (_)=> showSelector(innerContext, index),
                                  child: Image.asset(
                                    note !=4 ? beatTypes[index].pathNote(note): beatTypes[index].path,
                                    fit: BoxFit.scaleDown,
                                    height: 40,
                                    width: 40,
                                    color: Theme.of(context).colorScheme.onSurface,
                                  ),
                                ),
                          ),
                        ),]
                      ),
                    ));
            }),
        )
          /*
        
        for (int j = 0; j < beatTypes.length / 4; j++)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var i = 0; j * 4 + i < beatTypes.length && i < 4; i++)
                Card(
                  child: SizedBox(
                    width: 75,
                    height: 50,
                    child: Center(
                      child: Builder(
                        builder:
                            (innerContext) => GestureDetector(
                              onTap:
                                  () => showSelector(innerContext, j * 4 + i),
                              onVerticalDragStart:
                                  (_) => showSelector(innerContext, j * 4 + i),
                              child: Image.asset(
                                beatTypes[j * 4 + i].path,
                                fit: BoxFit.scaleDown,
                                height: 40,
                                width: 40,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                            ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
*/

      ],
    );
  }
}
