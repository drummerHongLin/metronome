// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_config_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerConfig {

 String get playerConfigNo; String get createTime; String get updateTime; int get bpm; int get beatNum; int get beatNote; int get referenceBeat; String get subBeats;
/// Create a copy of PlayerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerConfigCopyWith<PlayerConfig> get copyWith => _$PlayerConfigCopyWithImpl<PlayerConfig>(this as PlayerConfig, _$identity);

  /// Serializes this PlayerConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerConfig&&(identical(other.playerConfigNo, playerConfigNo) || other.playerConfigNo == playerConfigNo)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.beatNum, beatNum) || other.beatNum == beatNum)&&(identical(other.beatNote, beatNote) || other.beatNote == beatNote)&&(identical(other.referenceBeat, referenceBeat) || other.referenceBeat == referenceBeat)&&(identical(other.subBeats, subBeats) || other.subBeats == subBeats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerConfigNo,createTime,updateTime,bpm,beatNum,beatNote,referenceBeat,subBeats);

@override
String toString() {
  return 'PlayerConfig(playerConfigNo: $playerConfigNo, createTime: $createTime, updateTime: $updateTime, bpm: $bpm, beatNum: $beatNum, beatNote: $beatNote, referenceBeat: $referenceBeat, subBeats: $subBeats)';
}


}

/// @nodoc
abstract mixin class $PlayerConfigCopyWith<$Res>  {
  factory $PlayerConfigCopyWith(PlayerConfig value, $Res Function(PlayerConfig) _then) = _$PlayerConfigCopyWithImpl;
@useResult
$Res call({
 String playerConfigNo, String createTime, String updateTime, int bpm, int beatNum, int beatNote, int referenceBeat, String subBeats
});




}
/// @nodoc
class _$PlayerConfigCopyWithImpl<$Res>
    implements $PlayerConfigCopyWith<$Res> {
  _$PlayerConfigCopyWithImpl(this._self, this._then);

  final PlayerConfig _self;
  final $Res Function(PlayerConfig) _then;

/// Create a copy of PlayerConfig
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerConfigNo = null,Object? createTime = null,Object? updateTime = null,Object? bpm = null,Object? beatNum = null,Object? beatNote = null,Object? referenceBeat = null,Object? subBeats = null,}) {
  return _then(_self.copyWith(
playerConfigNo: null == playerConfigNo ? _self.playerConfigNo : playerConfigNo // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String,bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,beatNum: null == beatNum ? _self.beatNum : beatNum // ignore: cast_nullable_to_non_nullable
as int,beatNote: null == beatNote ? _self.beatNote : beatNote // ignore: cast_nullable_to_non_nullable
as int,referenceBeat: null == referenceBeat ? _self.referenceBeat : referenceBeat // ignore: cast_nullable_to_non_nullable
as int,subBeats: null == subBeats ? _self.subBeats : subBeats // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerConfig].
extension PlayerConfigPatterns on PlayerConfig {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerConfig value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerConfig() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerConfig value)  $default,){
final _that = this;
switch (_that) {
case _PlayerConfig():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerConfig value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerConfig() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playerConfigNo,  String createTime,  String updateTime,  int bpm,  int beatNum,  int beatNote,  int referenceBeat,  String subBeats)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerConfig() when $default != null:
return $default(_that.playerConfigNo,_that.createTime,_that.updateTime,_that.bpm,_that.beatNum,_that.beatNote,_that.referenceBeat,_that.subBeats);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playerConfigNo,  String createTime,  String updateTime,  int bpm,  int beatNum,  int beatNote,  int referenceBeat,  String subBeats)  $default,) {final _that = this;
switch (_that) {
case _PlayerConfig():
return $default(_that.playerConfigNo,_that.createTime,_that.updateTime,_that.bpm,_that.beatNum,_that.beatNote,_that.referenceBeat,_that.subBeats);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playerConfigNo,  String createTime,  String updateTime,  int bpm,  int beatNum,  int beatNote,  int referenceBeat,  String subBeats)?  $default,) {final _that = this;
switch (_that) {
case _PlayerConfig() when $default != null:
return $default(_that.playerConfigNo,_that.createTime,_that.updateTime,_that.bpm,_that.beatNum,_that.beatNote,_that.referenceBeat,_that.subBeats);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerConfig implements PlayerConfig {
  const _PlayerConfig({required this.playerConfigNo, required this.createTime, required this.updateTime, required this.bpm, required this.beatNum, required this.beatNote, required this.referenceBeat, required this.subBeats});
  factory _PlayerConfig.fromJson(Map<String, dynamic> json) => _$PlayerConfigFromJson(json);

@override final  String playerConfigNo;
@override final  String createTime;
@override final  String updateTime;
@override final  int bpm;
@override final  int beatNum;
@override final  int beatNote;
@override final  int referenceBeat;
@override final  String subBeats;

/// Create a copy of PlayerConfig
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerConfigCopyWith<_PlayerConfig> get copyWith => __$PlayerConfigCopyWithImpl<_PlayerConfig>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerConfigToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerConfig&&(identical(other.playerConfigNo, playerConfigNo) || other.playerConfigNo == playerConfigNo)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.beatNum, beatNum) || other.beatNum == beatNum)&&(identical(other.beatNote, beatNote) || other.beatNote == beatNote)&&(identical(other.referenceBeat, referenceBeat) || other.referenceBeat == referenceBeat)&&(identical(other.subBeats, subBeats) || other.subBeats == subBeats));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerConfigNo,createTime,updateTime,bpm,beatNum,beatNote,referenceBeat,subBeats);

@override
String toString() {
  return 'PlayerConfig(playerConfigNo: $playerConfigNo, createTime: $createTime, updateTime: $updateTime, bpm: $bpm, beatNum: $beatNum, beatNote: $beatNote, referenceBeat: $referenceBeat, subBeats: $subBeats)';
}


}

/// @nodoc
abstract mixin class _$PlayerConfigCopyWith<$Res> implements $PlayerConfigCopyWith<$Res> {
  factory _$PlayerConfigCopyWith(_PlayerConfig value, $Res Function(_PlayerConfig) _then) = __$PlayerConfigCopyWithImpl;
@override @useResult
$Res call({
 String playerConfigNo, String createTime, String updateTime, int bpm, int beatNum, int beatNote, int referenceBeat, String subBeats
});




}
/// @nodoc
class __$PlayerConfigCopyWithImpl<$Res>
    implements _$PlayerConfigCopyWith<$Res> {
  __$PlayerConfigCopyWithImpl(this._self, this._then);

  final _PlayerConfig _self;
  final $Res Function(_PlayerConfig) _then;

/// Create a copy of PlayerConfig
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerConfigNo = null,Object? createTime = null,Object? updateTime = null,Object? bpm = null,Object? beatNum = null,Object? beatNote = null,Object? referenceBeat = null,Object? subBeats = null,}) {
  return _then(_PlayerConfig(
playerConfigNo: null == playerConfigNo ? _self.playerConfigNo : playerConfigNo // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String,bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,beatNum: null == beatNum ? _self.beatNum : beatNum // ignore: cast_nullable_to_non_nullable
as int,beatNote: null == beatNote ? _self.beatNote : beatNote // ignore: cast_nullable_to_non_nullable
as int,referenceBeat: null == referenceBeat ? _self.referenceBeat : referenceBeat // ignore: cast_nullable_to_non_nullable
as int,subBeats: null == subBeats ? _self.subBeats : subBeats // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
