// ignore_for_file: constant_identifier_names

import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/repo/model/player_config.dart';
import 'package:flutter_metronome/repo/player_config_repo.dart';
import 'package:flutter_metronome/service/services/audio/sound.dart';
import 'package:flutter_metronome/utils/command.dart';
import 'package:flutter_metronome/utils/result.dart';
import 'package:flutter_soloud/flutter_soloud.dart';
import 'package:intl/intl.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class MainScreenViewModel extends ChangeNotifier {
  MainScreenViewModel({required PlayerConfigRepo configRepo})
    : _configRepo = configRepo {
    getConfigHis = Command0(_getConfigHis);
    deleteConfig = Command1<void, PlayerConfigInfo>(_deleteConfig);

    changePlayer();
  }

  // 更新存储缘
  MainScreenViewModel updatePlayerConfig(PlayerConfigRepo configRepo) {
    _configRepo = configRepo;
    return this;
  }

  // 消息提示组件

  ValueNotifier<String?> snackBarMessage = ValueNotifier(null);

  // 依赖注入
  PlayerConfigRepo _configRepo;

  // 历史配置相关

  ValueNotifier<PlayerConfigInfo?> currentConfig = ValueNotifier(null);

  ValueNotifier<List<PlayerConfigInfo>> configHis = ValueNotifier([]);

  late final Command0 getConfigHis;
  late final Command1 deleteConfig;

  // 定时器相关
  ValueNotifier<int> tRemind = ValueNotifier(0);

  void setTRemind(int m, int s) {
    if (m + s > 0) {
      tRemind.value = m * 60 + s;
      runningState.value = 1;
    } else {
      tRemind.value = 0;
      runningState.value = 0;
    }
  }

  Timer? _timer;

  ValueNotifier<int> runningState = ValueNotifier(0); // 0-未运行; 1-暂停; 2-运行中

  // 播放器相关的参数
  // 1.bpm
  int _bpm = 60;
  set bpm(v) {
    if (v != _bpm) {
      _isChange = true;
      _bpm = v;
    }
  }

  int _lastBpm = 60;
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
  int _beatNum = 4;
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
  int _beatNote = 4;
  set beatNote(v) {
    if (v != _beatNote) {
      _isChange = true;
      _beatNote = v;
      if (v != 4) {
        setBeatsToA();
      }
    }
  }

  int get beatNote => _beatNote;

  // 4. 参考音符
  ReferenceBeat _referenceBeat = ReferenceBeat.quarter_note;
  ReferenceBeat get referenceBeat => _referenceBeat;
  set referenceBeat(v) {
    if (v != _referenceBeat) {
      _isChange = true;
      _referenceBeat = v;
    }
  }

  // 5. 细分节拍
  List<BeatType> _beatTypes = [BeatType.A, BeatType.A, BeatType.A, BeatType.A];

  get beatTypes => _beatTypes;

  void setBeatType(int index, BeatType value) {
    assert(index < _beatTypes.length);
    if (_beatTypes[index] != value) {
      _beatTypes[index] = value;
      _isChange = true;
    }
  }

  void setBeatsToA() {
    for (var i = 0; i < _beatTypes.length; i++) {
      _beatTypes[i] = BeatType.A;
    }
  }

  // 6. 当前是否播放标志

  bool _isPlaying = false;
  bool get isPlaying => _isPlaying;

  // 7. 是否有变动标志
  bool _isChange = false;
  bool get isChange => _isChange;

  double lottieControllerValue = 0;
  double beatControllerValue = 0;

  // 8. 音源是否配置成功
  bool isInitialized = false;

  late AudioSource sound;
  late SoundHandle handle;

  // 根据音乐参数生成音源
  // 1. 根据拍数确定播放器的数量
  // 2. 需要传入每拍的拍子类型
  // 3. 需要每一拍时值， 每一拍是均匀的
  Uint8List generateSound(
    int m,
    int duration,
    List<BeatType> type,
    bool firstHev,
  ) {
    assert(m == type.length);

    final sources = <Sound>[];
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
    return generateSoundMemo(sources);
  }

  // 函数功能
  void startTimer() {
    runningState.value = 2;
    _timer = Timer.periodic(Duration(seconds: 1), (t) {
      tRemind.value--;
      if (tRemind.value <= 0) {
        t.cancel();
        runningState.value = 0;
        tRemind.value = 0;
      }
    });
  }

  void endTimer() {
    runningState.value = 0;
    if (_timer != null) _timer!.cancel();
    _timer = null;
    tRemind.value = 0;
  }

  void pauseTimer() {
    runningState.value = 1;
    if (_timer != null) _timer!.cancel();
    _timer = null;
  }

  void startPlayer() async {
    _isPlaying = true;
    SoLoud.instance.setPause(handle, false);
  }

  void pausePlayer() {
    _isPlaying = false;
    SoLoud.instance.setPause(handle, true);
  }

  // 播放
  void play() {
    startPlayer();
    WakelockPlus.toggle(enable: true);
    if (runningState.value == 1) startTimer(); // 暂停
    notifyListeners();
  }

  // 手动暂停
  void pause() {
    pausePlayer();
    WakelockPlus.toggle(enable: false);
    if (runningState.value == 2) pauseTimer();
    notifyListeners();
  }

  // 页面dispose造成的暂停
  void pauseBySystem() {
    pausePlayer();
    WakelockPlus.toggle(enable: false);
    if (runningState.value == 2) pauseTimer();
  }

  // 获取同步时间
  int get duration =>
      (60 * _referenceBeat.value() / (_bpm * _beatNote) * 1000).toInt();

  // 选择暂停
  void pauseOnSelect() {
    SoLoud.instance.setPause(handle, true);
  }

  // 重置播放器
  Future<void> changePlayer() async {
    //SoLoud.instance.listPlaybackDevices();
    await SoLoud.instance.disposeAllSources();
    _isPlaying = false;
    _isChange = false;
    isInitialized = false;
    notifyListeners();
    final sources = generateSound(_beatNum, duration, _beatTypes, false);
    sound = await SoLoud.instance.loadMem(
      "temp.wav",
      sources,
      mode: LoadMode.memory,
    );
    handle = await SoLoud.instance.play(sound, paused: true, looping: true);
    isInitialized = true;
    notifyListeners();
  }

  /*
  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }
*/
  void resetPlayer(
    int bpm,
    int beatNum,
    int beatNote,
    ReferenceBeat referenceBeat,
    List<BeatType> beatTypes,
  ) {
    _beatTypes = beatTypes;
    this.bpm = bpm;
    this.beatNote = beatNote;
    this.beatNum = beatNum;
    this.referenceBeat = referenceBeat;
    _isChange = true;
  }

  // 播放设置相关

  PlayerConfigInfo createConfigByCurrentPare(String? title) {
    final playerConfigNo = "PC${DateTime.now().millisecondsSinceEpoch}";
    return PlayerConfigInfo(
      playerConfigNo: playerConfigNo,
      createTime: DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
      updateTime: DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
      bpm: _bpm,
      beatNum: _beatNum,
      beatNote: _beatNote,
      referenceBeat: _referenceBeat,
      subBeats: _beatTypes,
      configTitle:
          title ??
          "新建节拍记录 - ${DateFormat('yyyy-MM-dd').format(DateTime.now())}",
    );
  }

  // 1. 保存当前系统配置
  Future<void> saveConfig({String? title, PlayerConfigInfo? pc}) async {
    late Result rst;
    if (pc != null) {
      pc.configTitle = title!;
      rst = await _configRepo.createNewPlayerConfig(pc);
    } else {
      pc = currentConfig.value!;
      pc.bpm = _bpm;
      pc.beatNote = _beatNote;
      pc.beatNum = _beatNum;
      pc.referenceBeat = _referenceBeat;
      pc.subBeats = _beatTypes;
      pc.updateTime = DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now());
      rst = await _configRepo.updatePlayerConfig(pc);
    }
    rst.when(
      success: (v) {
        currentConfig.value = pc;
        snackBarMessage.value = '保存设置成功! - ${pc!.configTitle}';
      },
      failure: (m, __) {
        currentConfig.value = null;
        snackBarMessage.value = m;
      },
    );
  }

  // 2. 获取历史配置信息
  Future<Result<void>> _getConfigHis() async {
    final offset = configHis.value.length;
    final limit = 5;
    final rst = await _configRepo.getPlayerConfigs(offset, limit);
    rst.when(
      success: (v) {
        configHis.value = [...configHis.value, ...v];
        return Success(null);
      },
      failure: (_, __) {
        return Failure("加载配置失败!");
      },
    );
    return rst;
  }

  // 3. 删除配置信息
  Future<Result<void>> _deleteConfig(PlayerConfigInfo p) async {
    if (currentConfig.value != null &&
        currentConfig.value!.playerConfigNo == p.playerConfigNo) {
      currentConfig.value = null;
    }
    final rst = await _configRepo.deletePlayerConfig(p.playerConfigNo);
    rst.when(
      success: (v) {
        final copy = [...configHis.value];
        copy.removeWhere((c) => c.playerConfigNo == p.playerConfigNo);
        configHis.value = copy;
      },
      failure: (_, __) {},
    );
    return rst;
  }

  // 4. 更新当前播放器
  void setPlayerByConfig(PlayerConfigInfo p) {
    currentConfig.value = p;
    resetPlayer(p.bpm, p.beatNum, p.beatNote, p.referenceBeat, p.subBeats);
  }
}
