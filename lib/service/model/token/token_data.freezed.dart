// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'token_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TokenInfo {

 String get value; int get expiredAt;
/// Create a copy of TokenInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenInfoCopyWith<TokenInfo> get copyWith => _$TokenInfoCopyWithImpl<TokenInfo>(this as TokenInfo, _$identity);

  /// Serializes this TokenInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenInfo&&(identical(other.value, value) || other.value == value)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,expiredAt);

@override
String toString() {
  return 'TokenInfo(value: $value, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class $TokenInfoCopyWith<$Res>  {
  factory $TokenInfoCopyWith(TokenInfo value, $Res Function(TokenInfo) _then) = _$TokenInfoCopyWithImpl;
@useResult
$Res call({
 String value, int expiredAt
});




}
/// @nodoc
class _$TokenInfoCopyWithImpl<$Res>
    implements $TokenInfoCopyWith<$Res> {
  _$TokenInfoCopyWithImpl(this._self, this._then);

  final TokenInfo _self;
  final $Res Function(TokenInfo) _then;

/// Create a copy of TokenInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? value = null,Object? expiredAt = null,}) {
  return _then(_self.copyWith(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,expiredAt: null == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TokenInfo].
extension TokenInfoPatterns on TokenInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenInfo value)  $default,){
final _that = this;
switch (_that) {
case _TokenInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TokenInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String value,  int expiredAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenInfo() when $default != null:
return $default(_that.value,_that.expiredAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String value,  int expiredAt)  $default,) {final _that = this;
switch (_that) {
case _TokenInfo():
return $default(_that.value,_that.expiredAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String value,  int expiredAt)?  $default,) {final _that = this;
switch (_that) {
case _TokenInfo() when $default != null:
return $default(_that.value,_that.expiredAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenInfo implements TokenInfo {
  const _TokenInfo({required this.value, required this.expiredAt});
  factory _TokenInfo.fromJson(Map<String, dynamic> json) => _$TokenInfoFromJson(json);

@override final  String value;
@override final  int expiredAt;

/// Create a copy of TokenInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenInfoCopyWith<_TokenInfo> get copyWith => __$TokenInfoCopyWithImpl<_TokenInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenInfo&&(identical(other.value, value) || other.value == value)&&(identical(other.expiredAt, expiredAt) || other.expiredAt == expiredAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,value,expiredAt);

@override
String toString() {
  return 'TokenInfo(value: $value, expiredAt: $expiredAt)';
}


}

/// @nodoc
abstract mixin class _$TokenInfoCopyWith<$Res> implements $TokenInfoCopyWith<$Res> {
  factory _$TokenInfoCopyWith(_TokenInfo value, $Res Function(_TokenInfo) _then) = __$TokenInfoCopyWithImpl;
@override @useResult
$Res call({
 String value, int expiredAt
});




}
/// @nodoc
class __$TokenInfoCopyWithImpl<$Res>
    implements _$TokenInfoCopyWith<$Res> {
  __$TokenInfoCopyWithImpl(this._self, this._then);

  final _TokenInfo _self;
  final $Res Function(_TokenInfo) _then;

/// Create a copy of TokenInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? value = null,Object? expiredAt = null,}) {
  return _then(_TokenInfo(
value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as String,expiredAt: null == expiredAt ? _self.expiredAt : expiredAt // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
