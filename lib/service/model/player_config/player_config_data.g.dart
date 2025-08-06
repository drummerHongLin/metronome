// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_config_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerConfig _$PlayerConfigFromJson(Map<String, dynamic> json) =>
    _PlayerConfig(
      playerConfigNo: json['playerConfigNo'] as String,
      createTime: json['createTime'] as String,
      updateTime: json['updateTime'] as String,
      bpm: (json['bpm'] as num).toInt(),
      beatNum: (json['beatNum'] as num).toInt(),
      beatNote: (json['beatNote'] as num).toInt(),
      referenceBeat: (json['referenceBeat'] as num).toInt(),
      subBeats: json['subBeats'] as String,
      configTitle: json['configTitle'] as String,
    );

Map<String, dynamic> _$PlayerConfigToJson(_PlayerConfig instance) =>
    <String, dynamic>{
      'playerConfigNo': instance.playerConfigNo,
      'createTime': instance.createTime,
      'updateTime': instance.updateTime,
      'bpm': instance.bpm,
      'beatNum': instance.beatNum,
      'beatNote': instance.beatNote,
      'referenceBeat': instance.referenceBeat,
      'subBeats': instance.subBeats,
      'configTitle': instance.configTitle,
    };
