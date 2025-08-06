import 'dart:convert';

import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/service/model/player_config/player_config_data.dart';

class PlayerConfigInfo {
  String playerConfigNo;
  String createTime;
  String updateTime;
  int bpm;
  int beatNum;
  int beatNote;
  ReferenceBeat referenceBeat;
  List<BeatType> subBeats;
  String configTitle;

  PlayerConfigInfo({
    required this.playerConfigNo,
    required this.createTime,
    required this.updateTime,
    required this.bpm,
    required this.beatNum,
    required this.beatNote,
    required this.referenceBeat,
    required this.subBeats,
    required this.configTitle
  });

  factory PlayerConfigInfo.fromData(PlayerConfig p) {
    // 1. 先从文本信息中解析出 
    final subBeats = List<int>.from(
      jsonDecode(p.subBeats),
    ).map((e) => BeatType.fromIndex(e)).toList();
    final referenceBeat = ReferenceBeat.fromIndex(p.referenceBeat);
    return PlayerConfigInfo(
      playerConfigNo: p.playerConfigNo,
      createTime: p.createTime,
      updateTime: p.updateTime,
      bpm: p.bpm,
      beatNum: p.beatNum,
      beatNote: p.beatNote,
      referenceBeat: referenceBeat,
      subBeats: subBeats,
      configTitle: p.configTitle
    );
  }
}
