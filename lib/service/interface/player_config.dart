import 'package:flutter_metronome/service/model/player_config/player_config_data.dart';

abstract class PlayerConfigService {
  Future<List<PlayerConfig>> getPlayerConfigs(int offset, int limit);
  Future<void> createPlayerConfig(PlayerConfig p);
  Future<void> updatePlayerConfig(PlayerConfig p);
  Future<void> deletePlayerConfig(String pNo);
}
