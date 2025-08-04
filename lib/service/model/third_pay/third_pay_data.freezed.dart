// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'third_pay_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TransactionInfo {

 String get accountToken; String get purchaseDate; String get transactionId; int get quantity; int get price;
/// Create a copy of TransactionInfo
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TransactionInfoCopyWith<TransactionInfo> get copyWith => _$TransactionInfoCopyWithImpl<TransactionInfo>(this as TransactionInfo, _$identity);

  /// Serializes this TransactionInfo to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TransactionInfo&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountToken,purchaseDate,transactionId,quantity,price);

@override
String toString() {
  return 'TransactionInfo(accountToken: $accountToken, purchaseDate: $purchaseDate, transactionId: $transactionId, quantity: $quantity, price: $price)';
}


}

/// @nodoc
abstract mixin class $TransactionInfoCopyWith<$Res>  {
  factory $TransactionInfoCopyWith(TransactionInfo value, $Res Function(TransactionInfo) _then) = _$TransactionInfoCopyWithImpl;
@useResult
$Res call({
 String accountToken, String purchaseDate, String transactionId, int quantity, int price
});




}
/// @nodoc
class _$TransactionInfoCopyWithImpl<$Res>
    implements $TransactionInfoCopyWith<$Res> {
  _$TransactionInfoCopyWithImpl(this._self, this._then);

  final TransactionInfo _self;
  final $Res Function(TransactionInfo) _then;

/// Create a copy of TransactionInfo
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountToken = null,Object? purchaseDate = null,Object? transactionId = null,Object? quantity = null,Object? price = null,}) {
  return _then(_self.copyWith(
accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [TransactionInfo].
extension TransactionInfoPatterns on TransactionInfo {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TransactionInfo value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TransactionInfo() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TransactionInfo value)  $default,){
final _that = this;
switch (_that) {
case _TransactionInfo():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TransactionInfo value)?  $default,){
final _that = this;
switch (_that) {
case _TransactionInfo() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountToken,  String purchaseDate,  String transactionId,  int quantity,  int price)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TransactionInfo() when $default != null:
return $default(_that.accountToken,_that.purchaseDate,_that.transactionId,_that.quantity,_that.price);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountToken,  String purchaseDate,  String transactionId,  int quantity,  int price)  $default,) {final _that = this;
switch (_that) {
case _TransactionInfo():
return $default(_that.accountToken,_that.purchaseDate,_that.transactionId,_that.quantity,_that.price);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountToken,  String purchaseDate,  String transactionId,  int quantity,  int price)?  $default,) {final _that = this;
switch (_that) {
case _TransactionInfo() when $default != null:
return $default(_that.accountToken,_that.purchaseDate,_that.transactionId,_that.quantity,_that.price);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TransactionInfo implements TransactionInfo {
  const _TransactionInfo({required this.accountToken, required this.purchaseDate, required this.transactionId, required this.quantity, required this.price});
  factory _TransactionInfo.fromJson(Map<String, dynamic> json) => _$TransactionInfoFromJson(json);

@override final  String accountToken;
@override final  String purchaseDate;
@override final  String transactionId;
@override final  int quantity;
@override final  int price;

/// Create a copy of TransactionInfo
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TransactionInfoCopyWith<_TransactionInfo> get copyWith => __$TransactionInfoCopyWithImpl<_TransactionInfo>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TransactionInfoToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TransactionInfo&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&(identical(other.purchaseDate, purchaseDate) || other.purchaseDate == purchaseDate)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.price, price) || other.price == price));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountToken,purchaseDate,transactionId,quantity,price);

@override
String toString() {
  return 'TransactionInfo(accountToken: $accountToken, purchaseDate: $purchaseDate, transactionId: $transactionId, quantity: $quantity, price: $price)';
}


}

/// @nodoc
abstract mixin class _$TransactionInfoCopyWith<$Res> implements $TransactionInfoCopyWith<$Res> {
  factory _$TransactionInfoCopyWith(_TransactionInfo value, $Res Function(_TransactionInfo) _then) = __$TransactionInfoCopyWithImpl;
@override @useResult
$Res call({
 String accountToken, String purchaseDate, String transactionId, int quantity, int price
});




}
/// @nodoc
class __$TransactionInfoCopyWithImpl<$Res>
    implements _$TransactionInfoCopyWith<$Res> {
  __$TransactionInfoCopyWithImpl(this._self, this._then);

  final _TransactionInfo _self;
  final $Res Function(_TransactionInfo) _then;

/// Create a copy of TransactionInfo
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountToken = null,Object? purchaseDate = null,Object? transactionId = null,Object? quantity = null,Object? price = null,}) {
  return _then(_TransactionInfo(
accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,purchaseDate: null == purchaseDate ? _self.purchaseDate : purchaseDate // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
