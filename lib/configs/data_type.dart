// ignore_for_file: constant_identifier_names



enum SoundType {
  com,
  hev,
  sub;

  (int k, double n) info() {
    return switch (this) {
      SoundType.com => (440, 0.7),
      SoundType.hev => (880, 0.9),
      SoundType.sub => (520, 0.4),
    };
  }
}

// 暂时先不考虑休止的情况
enum BeatType {
  A, // 四分音符
  BB, // 八分
  CCCC, // 十六分
  DDD, // 三连音
  CC00, // 附点变奏
  C00C, // 附点变奏
  DDdd,
  ddDD0,
  DddD1,
  Bddd,
  dddB0;

  List<int> value() {
    return switch (this) {
      BeatType.A => [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      BeatType.BB => [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0],
      BeatType.CCCC => [1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0],
      BeatType.DDD => [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0],
      BeatType.CC00 => [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
      BeatType.C00C => [1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0],
      BeatType.DDdd => [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0],
      BeatType.ddDD0 => [1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0],
      BeatType.DddD1 => [1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0],
      BeatType.Bddd => [1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0],
      BeatType.dddB0 => [1, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0],
    };
  }
  String get path => 'assets/images/$name.webp';
}

// 节拍参考音符

enum ReferenceBeat { whole_note,half_note,quarter_note,   quaver, semi_quaver;

  int value(){
    return switch(this){
      ReferenceBeat.whole_note => 1,
      ReferenceBeat.half_note => 2,
      ReferenceBeat.quarter_note =>4,
      ReferenceBeat.quaver => 8,
      ReferenceBeat.semi_quaver => 16
    };
  }

  String get path => 'assets/images/$name.webp';



 }
