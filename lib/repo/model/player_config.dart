import 'package:flutter_metronome/configs/data_type.dart';

class PlayerConfigInfo {
  String playerConfigNo;
  String createTime;
  String updateTime;
  int bpm;
  int beatNum;
  int beatNote;
  ReferenceBeat referenceBeat;
  List<BeatType> subBeats;

  PlayerConfigInfo({
    required  this.playerConfigNo,
    required this.createTime,
    required this.updateTime,
    required this.bpm,
    required this.beatNum,
    required this.beatNote,
    required this.referenceBeat,
    required this.subBeats,
  });
}
