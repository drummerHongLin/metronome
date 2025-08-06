


import 'package:freezed_annotation/freezed_annotation.dart';


part 'player_config_data.g.dart';
part 'player_config_data.freezed.dart';

@freezed
abstract class PlayerConfig with _$PlayerConfig {
  
  const factory PlayerConfig({
    required String playerConfigNo,
    required String  createTime,
    required String  updateTime,
    required int bpm,
    required int beatNum,
    required int beatNote,
    required int referenceBeat,
    required String subBeats
  }) = _PlayerConfig;

  factory PlayerConfig.fromJson(Map<String,dynamic> json) => _$PlayerConfigFromJson(json);

}