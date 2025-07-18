// ignore_for_file: constant_identifier_names

import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/service/audio/sound.dart';
import 'package:just_audio/just_audio.dart';


abstract class Audio {
  // 1. 根据拍数确定播放器的数量
  // 2. 需要传入每拍的拍子类型
  // 3. 需要每一拍时值， 每一拍是均匀的
  static Future<AudioPlayer> generatePlayer(
    int m,
    int duration,
    List<BeatType> type,
    bool firstHev,
  ) async {
    assert(m == type.length);
    final player = AudioPlayer();
    player.setLoopMode(LoopMode.all);
    final sources = <AudioSource>[];
    for (int i = 0; i < m; i++) {
      final isSubdivided = type[i] != BeatType.A;
      late SoundType soundtype;
      if (i == 0 && firstHev && !isSubdivided) {
        soundtype = SoundType.hev;
      } else if (!isSubdivided) {
        soundtype = SoundType.com;
      } else {
        soundtype = SoundType.sub;
      }

      final sb = type[i].value();
      Sound soundSource = Sound(
        soundDuration: duration,
        k: soundtype.info().$1,
        n: soundtype.info().$2,
        subNotes: sb,
      );
      sources.add(soundSource);
    }
    await player.setAudioSources(sources);
    return player;
  }
}
