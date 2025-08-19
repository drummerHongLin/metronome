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

 String get playConfigNo; String get createTime; String get updateTime; int get bpm; int get beatNum; int get beatNote; int get referenceBeat; String get subBeats; String get configTitle;
/// Create a copy of PlayerConfig
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerConfigCopyWith<PlayerConfig> get copyWith => _$PlayerConfigCopyWithImpl<PlayerConfig>(this as PlayerConfig, _$identity);

  /// Serializes this PlayerConfig to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerConfig&&(identical(other.playConfigNo, playConfigNo) || other.playConfigNo == playConfigNo)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.beatNum, beatNum) || other.beatNum == beatNum)&&(identical(other.beatNote, beatNote) || other.beatNote == beatNote)&&(identical(other.referenceBeat, referenceBeat) || other.referenceBeat == referenceBeat)&&(identical(other.subBeats, subBeats) || other.subBeats == subBeats)&&(identical(other.configTitle, configTitle) || other.configTitle == configTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playConfigNo,createTime,updateTime,bpm,beatNum,beatNote,referenceBeat,subBeats,configTitle);

@override
String toString() {
  return 'PlayerConfig(playConfigNo: $playConfigNo, createTime: $createTime, updateTime: $updateTime, bpm: $bpm, beatNum: $beatNum, beatNote: $beatNote, referenceBeat: $referenceBeat, subBeats: $subBeats, configTitle: $configTitle)';
}


}

/// @nodoc
abstract mixin class $PlayerConfigCopyWith<$Res>  {
  factory $PlayerConfigCopyWith(PlayerConfig value, $Res Function(PlayerConfig) _then) = _$PlayerConfigCopyWithImpl;
@useResult
$Res call({
 String playConfigNo, String createTime, String updateTime, int bpm, int beatNum, int beatNote, int referenceBeat, String subBeats, String configTitle
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
@pragma('vm:prefer-inline') @override $Res call({Object? playConfigNo = null,Object? createTime = null,Object? updateTime = null,Object? bpm = null,Object? beatNum = null,Object? beatNote = null,Object? referenceBeat = null,Object? subBeats = null,Object? configTitle = null,}) {
  return _then(_self.copyWith(
playConfigNo: null == playConfigNo ? _self.playConfigNo : playConfigNo // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String,bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,beatNum: null == beatNum ? _self.beatNum : beatNum // ignore: cast_nullable_to_non_nullable
as int,beatNote: null == beatNote ? _self.beatNote : beatNote // ignore: cast_nullable_to_non_nullable
as int,referenceBeat: null == referenceBeat ? _self.referenceBeat : referenceBeat // ignore: cast_nullable_to_non_nullable
as int,subBeats: null == subBeats ? _self.subBeats : subBeats // ignore: cast_nullable_to_non_nullable
as String,configTitle: null == configTitle ? _self.configTitle : configTitle // ignore: cast_nullable_to_non_nullable
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String playConfigNo,  String createTime,  String updateTime,  int bpm,  int beatNum,  int beatNote,  int referenceBeat,  String subBeats,  String configTitle)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerConfig() when $default != null:
return $default(_that.playConfigNo,_that.createTime,_that.updateTime,_that.bpm,_that.beatNum,_that.beatNote,_that.referenceBeat,_that.subBeats,_that.configTitle);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String playConfigNo,  String createTime,  String updateTime,  int bpm,  int beatNum,  int beatNote,  int referenceBeat,  String subBeats,  String configTitle)  $default,) {final _that = this;
switch (_that) {
case _PlayerConfig():
return $default(_that.playConfigNo,_that.createTime,_that.updateTime,_that.bpm,_that.beatNum,_that.beatNote,_that.referenceBeat,_that.subBeats,_that.configTitle);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String playConfigNo,  String createTime,  String updateTime,  int bpm,  int beatNum,  int beatNote,  int referenceBeat,  String subBeats,  String configTitle)?  $default,) {final _that = this;
switch (_that) {
case _PlayerConfig() when $default != null:
return $default(_that.playConfigNo,_that.createTime,_that.updateTime,_that.bpm,_that.beatNum,_that.beatNote,_that.referenceBeat,_that.subBeats,_that.configTitle);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerConfig implements PlayerConfig {
  const _PlayerConfig({required this.playConfigNo, required this.createTime, required this.updateTime, required this.bpm, required this.beatNum, required this.beatNote, required this.referenceBeat, required this.subBeats, required this.configTitle});
  factory _PlayerConfig.fromJson(Map<String, dynamic> json) => _$PlayerConfigFromJson(json);

@override final  String playConfigNo;
@override final  String createTime;
@override final  String updateTime;
@override final  int bpm;
@override final  int beatNum;
@override final  int beatNote;
@override final  int referenceBeat;
@override final  String subBeats;
@override final  String configTitle;

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
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerConfig&&(identical(other.playConfigNo, playConfigNo) || other.playConfigNo == playConfigNo)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.updateTime, updateTime) || other.updateTime == updateTime)&&(identical(other.bpm, bpm) || other.bpm == bpm)&&(identical(other.beatNum, beatNum) || other.beatNum == beatNum)&&(identical(other.beatNote, beatNote) || other.beatNote == beatNote)&&(identical(other.referenceBeat, referenceBeat) || other.referenceBeat == referenceBeat)&&(identical(other.subBeats, subBeats) || other.subBeats == subBeats)&&(identical(other.configTitle, configTitle) || other.configTitle == configTitle));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playConfigNo,createTime,updateTime,bpm,beatNum,beatNote,referenceBeat,subBeats,configTitle);

@override
String toString() {
  return 'PlayerConfig(playConfigNo: $playConfigNo, createTime: $createTime, updateTime: $updateTime, bpm: $bpm, beatNum: $beatNum, beatNote: $beatNote, referenceBeat: $referenceBeat, subBeats: $subBeats, configTitle: $configTitle)';
}


}

/// @nodoc
abstract mixin class _$PlayerConfigCopyWith<$Res> implements $PlayerConfigCopyWith<$Res> {
  factory _$PlayerConfigCopyWith(_PlayerConfig value, $Res Function(_PlayerConfig) _then) = __$PlayerConfigCopyWithImpl;
@override @useResult
$Res call({
 String playConfigNo, String createTime, String updateTime, int bpm, int beatNum, int beatNote, int referenceBeat, String subBeats, String configTitle
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
@override @pragma('vm:prefer-inline') $Res call({Object? playConfigNo = null,Object? createTime = null,Object? updateTime = null,Object? bpm = null,Object? beatNum = null,Object? beatNote = null,Object? referenceBeat = null,Object? subBeats = null,Object? configTitle = null,}) {
  return _then(_PlayerConfig(
playConfigNo: null == playConfigNo ? _self.playConfigNo : playConfigNo // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,updateTime: null == updateTime ? _self.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String,bpm: null == bpm ? _self.bpm : bpm // ignore: cast_nullable_to_non_nullable
as int,beatNum: null == beatNum ? _self.beatNum : beatNum // ignore: cast_nullable_to_non_nullable
as int,beatNote: null == beatNote ? _self.beatNote : beatNote // ignore: cast_nullable_to_non_nullable
as int,referenceBeat: null == referenceBeat ? _self.referenceBeat : referenceBeat // ignore: cast_nullable_to_non_nullable
as int,subBeats: null == subBeats ? _self.subBeats : subBeats // ignore: cast_nullable_to_non_nullable
as String,configTitle: null == configTitle ? _self.configTitle : configTitle // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GetPlayerConfigsResponse {

 bool get hasMore; List<PlayerConfig> get playConfigs;
/// Create a copy of GetPlayerConfigsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPlayerConfigsResponseCopyWith<GetPlayerConfigsResponse> get copyWith => _$GetPlayerConfigsResponseCopyWithImpl<GetPlayerConfigsResponse>(this as GetPlayerConfigsResponse, _$identity);

  /// Serializes this GetPlayerConfigsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPlayerConfigsResponse&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.playConfigs, playConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasMore,const DeepCollectionEquality().hash(playConfigs));

@override
String toString() {
  return 'GetPlayerConfigsResponse(hasMore: $hasMore, playConfigs: $playConfigs)';
}


}

/// @nodoc
abstract mixin class $GetPlayerConfigsResponseCopyWith<$Res>  {
  factory $GetPlayerConfigsResponseCopyWith(GetPlayerConfigsResponse value, $Res Function(GetPlayerConfigsResponse) _then) = _$GetPlayerConfigsResponseCopyWithImpl;
@useResult
$Res call({
 bool hasMore, List<PlayerConfig> playConfigs
});




}
/// @nodoc
class _$GetPlayerConfigsResponseCopyWithImpl<$Res>
    implements $GetPlayerConfigsResponseCopyWith<$Res> {
  _$GetPlayerConfigsResponseCopyWithImpl(this._self, this._then);

  final GetPlayerConfigsResponse _self;
  final $Res Function(GetPlayerConfigsResponse) _then;

/// Create a copy of GetPlayerConfigsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasMore = null,Object? playConfigs = null,}) {
  return _then(_self.copyWith(
hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,playConfigs: null == playConfigs ? _self.playConfigs : playConfigs // ignore: cast_nullable_to_non_nullable
as List<PlayerConfig>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPlayerConfigsResponse].
extension GetPlayerConfigsResponsePatterns on GetPlayerConfigsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPlayerConfigsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPlayerConfigsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPlayerConfigsResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPlayerConfigsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPlayerConfigsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPlayerConfigsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool hasMore,  List<PlayerConfig> playConfigs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPlayerConfigsResponse() when $default != null:
return $default(_that.hasMore,_that.playConfigs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool hasMore,  List<PlayerConfig> playConfigs)  $default,) {final _that = this;
switch (_that) {
case _GetPlayerConfigsResponse():
return $default(_that.hasMore,_that.playConfigs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool hasMore,  List<PlayerConfig> playConfigs)?  $default,) {final _that = this;
switch (_that) {
case _GetPlayerConfigsResponse() when $default != null:
return $default(_that.hasMore,_that.playConfigs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPlayerConfigsResponse implements GetPlayerConfigsResponse {
  const _GetPlayerConfigsResponse({required this.hasMore, required final  List<PlayerConfig> playConfigs}): _playConfigs = playConfigs;
  factory _GetPlayerConfigsResponse.fromJson(Map<String, dynamic> json) => _$GetPlayerConfigsResponseFromJson(json);

@override final  bool hasMore;
 final  List<PlayerConfig> _playConfigs;
@override List<PlayerConfig> get playConfigs {
  if (_playConfigs is EqualUnmodifiableListView) return _playConfigs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playConfigs);
}


/// Create a copy of GetPlayerConfigsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPlayerConfigsResponseCopyWith<_GetPlayerConfigsResponse> get copyWith => __$GetPlayerConfigsResponseCopyWithImpl<_GetPlayerConfigsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPlayerConfigsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPlayerConfigsResponse&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other._playConfigs, _playConfigs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,hasMore,const DeepCollectionEquality().hash(_playConfigs));

@override
String toString() {
  return 'GetPlayerConfigsResponse(hasMore: $hasMore, playConfigs: $playConfigs)';
}


}

/// @nodoc
abstract mixin class _$GetPlayerConfigsResponseCopyWith<$Res> implements $GetPlayerConfigsResponseCopyWith<$Res> {
  factory _$GetPlayerConfigsResponseCopyWith(_GetPlayerConfigsResponse value, $Res Function(_GetPlayerConfigsResponse) _then) = __$GetPlayerConfigsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool hasMore, List<PlayerConfig> playConfigs
});




}
/// @nodoc
class __$GetPlayerConfigsResponseCopyWithImpl<$Res>
    implements _$GetPlayerConfigsResponseCopyWith<$Res> {
  __$GetPlayerConfigsResponseCopyWithImpl(this._self, this._then);

  final _GetPlayerConfigsResponse _self;
  final $Res Function(_GetPlayerConfigsResponse) _then;

/// Create a copy of GetPlayerConfigsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasMore = null,Object? playConfigs = null,}) {
  return _then(_GetPlayerConfigsResponse(
hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,playConfigs: null == playConfigs ? _self._playConfigs : playConfigs // ignore: cast_nullable_to_non_nullable
as List<PlayerConfig>,
  ));
}


}

// dart format on
