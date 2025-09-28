import 'package:flutter_metronome/repo/model/player_config.dart';
import 'package:flutter_metronome/service/interface/player_config.dart';
import 'package:flutter_metronome/service/model/player_config/player_config_data.dart';
import 'package:flutter_metronome/utils/result.dart';

class PlayerConfigRepo {
  final PlayerConfigService _playerConfigService;

  PlayerConfigRepo({required PlayerConfigService playerConfigService})
    : _playerConfigService = playerConfigService;

  bool hasMore = true;

  Future<Result<void>> createNewPlayerConfig(PlayerConfigInfo p) async {
    try {
      final s = p.subBeats.map((e) => e.index).toList().toString();
      final pd = PlayerConfig(
        playConfigNo: p.playerConfigNo,
        createTime: p.createTime,
        updateTime: p.updateTime,
        bpm: p.bpm,
        beatNum: p.beatNum,
        beatNote: p.beatNote,
        referenceBeat: p.referenceBeat.index,
        subBeats: s,
        configTitle: p.configTitle,
      );
      await _playerConfigService.createPlayerConfig(pd);
      hasMore = true;
      return Success(null);
    } on Exception catch (e) {
      return Failure("创建节拍失败! ${e.toString()}", e);
    }
  }

  Future<Result<void>> updatePlayerConfig(PlayerConfigInfo p) async {
    try {
      final s = p.subBeats.map((e) => e.index).toList().toString();
      final pd = PlayerConfig(
        playConfigNo: p.playerConfigNo,
        createTime: p.createTime,
        updateTime: p.updateTime,
        bpm: p.bpm,
        beatNum: p.beatNum,
        beatNote: p.beatNote,
        referenceBeat: p.referenceBeat.index,
        subBeats: s,
        configTitle: p.configTitle,
      );
      await _playerConfigService.updatePlayerConfig(pd);
      return Success(null);
    } on Exception catch (e) {
      return Failure("更新节拍失败!", e);
    }
  }

  Future<Result<void>> deletePlayerConfig(String pNo) async {
    try {
      await _playerConfigService.deletePlayerConfig(pNo);
      return Success(null);
    } on Exception catch (e) {
      return Failure("刪除节拍失败!", e);
    }
  }

  Future<Result<List<PlayerConfigInfo>>> getPlayerConfigs(
    int offset,
    int limit,
  ) async {
    if (!hasMore) return Failure("暂无更多记录");
    try {
      final rst = await _playerConfigService.getPlayerConfigs(offset, limit);
      hasMore = rst.hasMore;
      final pList = rst.playConfigs
          .map((p) => PlayerConfigInfo.fromData(p))
          .toList();
      return Success(pList);
    } on Exception catch (e) {
      return Failure("获取历史节拍记录失败!", e);
    }
  }
}
