// ignore_for_file: constant_identifier_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/service/audio/sound.dart';
import 'package:just_audio/just_audio.dart';

class MainScreenViewModel extends ChangeNotifier {
  MainScreenViewModel({
    required int bpm,
    required int beatNum,
    required int beatNote,
    required ReferenceBeat referenceBeat,
    required List<BeatType> beatTypes,
  }) : _bpm = bpm,
       _beatNote = beatNote,
       _beatNum = beatNum,
       _referenceBeat = referenceBeat,
       _beatTypes = beatTypes,
       _lastBpm = bpm {
    _player = AudioPlayer();
    _player.setLoopMode(LoopMode.all);
    changePlayer();
  }

  // 定时器相关
  ValueNotifier<int> tRemind = ValueNotifier(0);

  void setTRemind(int m, int s) {
    if(m+s>0) {
       tRemind.value = m * 60 + s;
       runningState.value = 1;
    }
    else {
       tRemind.value = 0;
       runningState.value = 0;
    }
   
  }

  Timer? _timer;

  ValueNotifier<int> runningState = ValueNotifier(0); // 0-未运行; 1-暂停; 2-运行中

  // 播放器相关的参数
  // 1.bpm
  int _bpm;
  set bpm(v) {
    if (v != _bpm) {
      _isChange = true;
      _bpm = v;
    }
  }

  int _lastBpm;
  set lastBpm(v) {
    _lastBpm = v;
  }

  void setBpmBySlider(int v) {
    if (v != _bpm) {
      _bpm = v;
      notifyListeners();
    }
  }

  void compareBpmAfterSlider() {
    _isChange = _bpm != _lastBpm;
    _lastBpm = _bpm;
  }

  get bpm => _bpm;

  // 2. 节拍数
  int _beatNum;
  set beatNum(v) {
    if (v != _beatNum) {
      _isChange = true;
      _beatNum = v;
    }
    if (_beatTypes.length > _beatNum) {
      _beatTypes = _beatTypes.sublist(0, _beatNum);
    } else if (_beatTypes.length < _beatNum) {
      for (int i = _beatTypes.length; i < _beatNum; i++) {
        _beatTypes.add(BeatType.A);
      }
    }
  }

  int get beatNum => _beatNum;

  // 3. 节拍音符
  int _beatNote;
  set beatNote(v) {
    if (v != _beatNote) {
      _isChange = true;
      _beatNote = v;
    }
  }

  get beatNote => _beatNote;

  // 4. 参考音符
  ReferenceBeat _referenceBeat;
  ReferenceBeat get referenceBeat => _referenceBeat;
  set referenceBeat(v) {
    if (v != _referenceBeat) {
      _isChange = true;
      _referenceBeat = v;
    }
  }

  // 5. 细分节拍
  List<BeatType> _beatTypes;

  get beatTypes => _beatTypes;

  void setBeatType(int index, BeatType value) {
    assert(index < _beatTypes.length);
    if (_beatTypes[index] != value) {
      _beatTypes[index] = value;
      _isChange = true;
    }
  }

  // 6. 当前是否播放标志
  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  // 7. 是否有变动标志
  bool _isChange = false;
  bool get isChange => _isChange;
  // 8.产出player
  late AudioPlayer _player;

  // 8. 音源是否配置成功
  bool isInitialized = false;

  // 根据音乐参数生成音源
  // 1. 根据拍数确定播放器的数量
  // 2. 需要传入每拍的拍子类型
  // 3. 需要每一拍时值， 每一拍是均匀的
  List<AudioSource> generateSound(
    int m,
    int duration,
    List<BeatType> type,
    bool firstHev,
  ) {
    assert(m == type.length);

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
    return sources;
  }

  // 函数功能
  void startTimer(){
    runningState.value = 2;
    _timer = Timer.periodic(Duration(seconds: 1), (t){
       tRemind.value--;
       if(tRemind.value <=0){
         t.cancel();
         runningState.value = 0;
         tRemind.value = 0;
       }
    });
  }
  void endTimer(){
    runningState.value = 0;
    if(_timer!=null) _timer!.cancel();
    _timer = null;
    tRemind.value = 0;
  }

  void pauseTimer(){
    runningState.value = 1;
    if(_timer!=null) _timer!.cancel();
    _timer = null;
  }


  void startPlayer(){
   _isPlaying = true;
    _player.play();
  }

  void pausePlayer(){
    _isPlaying = false;
    _player.pause();
  }

  // 播放
  void play() {
    startPlayer();
    if(runningState.value == 1) startTimer(); // 暂停
    notifyListeners();
  }

  // 手动暂停
  void pause() {
    pausePlayer();
    if(runningState.value == 2) pauseTimer();
    notifyListeners();
  }

  // 获取同步时间
  int get duration =>
      (60 * _referenceBeat.value() / (_bpm * _beatNote) * 1000).toInt();

  // 选择暂停
  void pauseOnSelect() {
    _player.pause();
  }

  // 重置播放器
  Future<void> changePlayer() async {
    if (_isPlaying) {
      _player.stop();
      _isPlaying = false;
    }
    _isChange = false;
    isInitialized = false;
    notifyListeners();
    final source = generateSound(_beatNum, duration, _beatTypes, false);
    await _player.setAudioSources(source);
    isInitialized = true;
    notifyListeners();
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  void resetPlayer(
    int bpm,
    int beatNum,
    int beatNote,
    ReferenceBeat referenceBeat,
    List<BeatType> beatTypes,
  ) {
    _bpm = bpm;
    _beatNote = beatNote;
    _beatNum = beatNum;
    _referenceBeat = referenceBeat;
    _beatTypes = beatTypes;
    changePlayer();
  }
}
