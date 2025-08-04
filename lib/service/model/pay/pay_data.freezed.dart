// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CreatePaymentRecordRequest {

 String get accountToken; String get createTime; String get productName; int get quantity; double get amount;
/// Create a copy of CreatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePaymentRecordRequestCopyWith<CreatePaymentRecordRequest> get copyWith => _$CreatePaymentRecordRequestCopyWithImpl<CreatePaymentRecordRequest>(this as CreatePaymentRecordRequest, _$identity);

  /// Serializes this CreatePaymentRecordRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePaymentRecordRequest&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountToken,createTime,productName,quantity,amount);

@override
String toString() {
  return 'CreatePaymentRecordRequest(accountToken: $accountToken, createTime: $createTime, productName: $productName, quantity: $quantity, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $CreatePaymentRecordRequestCopyWith<$Res>  {
  factory $CreatePaymentRecordRequestCopyWith(CreatePaymentRecordRequest value, $Res Function(CreatePaymentRecordRequest) _then) = _$CreatePaymentRecordRequestCopyWithImpl;
@useResult
$Res call({
 String accountToken, String createTime, String productName, int quantity, double amount
});




}
/// @nodoc
class _$CreatePaymentRecordRequestCopyWithImpl<$Res>
    implements $CreatePaymentRecordRequestCopyWith<$Res> {
  _$CreatePaymentRecordRequestCopyWithImpl(this._self, this._then);

  final CreatePaymentRecordRequest _self;
  final $Res Function(CreatePaymentRecordRequest) _then;

/// Create a copy of CreatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountToken = null,Object? createTime = null,Object? productName = null,Object? quantity = null,Object? amount = null,}) {
  return _then(_self.copyWith(
accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePaymentRecordRequest].
extension CreatePaymentRecordRequestPatterns on CreatePaymentRecordRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePaymentRecordRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePaymentRecordRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePaymentRecordRequest value)  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentRecordRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePaymentRecordRequest value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentRecordRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountToken,  String createTime,  String productName,  int quantity,  double amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePaymentRecordRequest() when $default != null:
return $default(_that.accountToken,_that.createTime,_that.productName,_that.quantity,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountToken,  String createTime,  String productName,  int quantity,  double amount)  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentRecordRequest():
return $default(_that.accountToken,_that.createTime,_that.productName,_that.quantity,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountToken,  String createTime,  String productName,  int quantity,  double amount)?  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentRecordRequest() when $default != null:
return $default(_that.accountToken,_that.createTime,_that.productName,_that.quantity,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePaymentRecordRequest implements CreatePaymentRecordRequest {
  const _CreatePaymentRecordRequest({required this.accountToken, required this.createTime, required this.productName, required this.quantity, required this.amount});
  factory _CreatePaymentRecordRequest.fromJson(Map<String, dynamic> json) => _$CreatePaymentRecordRequestFromJson(json);

@override final  String accountToken;
@override final  String createTime;
@override final  String productName;
@override final  int quantity;
@override final  double amount;

/// Create a copy of CreatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePaymentRecordRequestCopyWith<_CreatePaymentRecordRequest> get copyWith => __$CreatePaymentRecordRequestCopyWithImpl<_CreatePaymentRecordRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePaymentRecordRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePaymentRecordRequest&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.productName, productName) || other.productName == productName)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountToken,createTime,productName,quantity,amount);

@override
String toString() {
  return 'CreatePaymentRecordRequest(accountToken: $accountToken, createTime: $createTime, productName: $productName, quantity: $quantity, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$CreatePaymentRecordRequestCopyWith<$Res> implements $CreatePaymentRecordRequestCopyWith<$Res> {
  factory _$CreatePaymentRecordRequestCopyWith(_CreatePaymentRecordRequest value, $Res Function(_CreatePaymentRecordRequest) _then) = __$CreatePaymentRecordRequestCopyWithImpl;
@override @useResult
$Res call({
 String accountToken, String createTime, String productName, int quantity, double amount
});




}
/// @nodoc
class __$CreatePaymentRecordRequestCopyWithImpl<$Res>
    implements _$CreatePaymentRecordRequestCopyWith<$Res> {
  __$CreatePaymentRecordRequestCopyWithImpl(this._self, this._then);

  final _CreatePaymentRecordRequest _self;
  final $Res Function(_CreatePaymentRecordRequest) _then;

/// Create a copy of CreatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountToken = null,Object? createTime = null,Object? productName = null,Object? quantity = null,Object? amount = null,}) {
  return _then(_CreatePaymentRecordRequest(
accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,productName: null == productName ? _self.productName : productName // ignore: cast_nullable_to_non_nullable
as String,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}


/// @nodoc
mixin _$CreatePaymentRecordResponse {

 String get paymentNo;
/// Create a copy of CreatePaymentRecordResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CreatePaymentRecordResponseCopyWith<CreatePaymentRecordResponse> get copyWith => _$CreatePaymentRecordResponseCopyWithImpl<CreatePaymentRecordResponse>(this as CreatePaymentRecordResponse, _$identity);

  /// Serializes this CreatePaymentRecordResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CreatePaymentRecordResponse&&(identical(other.paymentNo, paymentNo) || other.paymentNo == paymentNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentNo);

@override
String toString() {
  return 'CreatePaymentRecordResponse(paymentNo: $paymentNo)';
}


}

/// @nodoc
abstract mixin class $CreatePaymentRecordResponseCopyWith<$Res>  {
  factory $CreatePaymentRecordResponseCopyWith(CreatePaymentRecordResponse value, $Res Function(CreatePaymentRecordResponse) _then) = _$CreatePaymentRecordResponseCopyWithImpl;
@useResult
$Res call({
 String paymentNo
});




}
/// @nodoc
class _$CreatePaymentRecordResponseCopyWithImpl<$Res>
    implements $CreatePaymentRecordResponseCopyWith<$Res> {
  _$CreatePaymentRecordResponseCopyWithImpl(this._self, this._then);

  final CreatePaymentRecordResponse _self;
  final $Res Function(CreatePaymentRecordResponse) _then;

/// Create a copy of CreatePaymentRecordResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentNo = null,}) {
  return _then(_self.copyWith(
paymentNo: null == paymentNo ? _self.paymentNo : paymentNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CreatePaymentRecordResponse].
extension CreatePaymentRecordResponsePatterns on CreatePaymentRecordResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CreatePaymentRecordResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CreatePaymentRecordResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CreatePaymentRecordResponse value)  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentRecordResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CreatePaymentRecordResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CreatePaymentRecordResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CreatePaymentRecordResponse() when $default != null:
return $default(_that.paymentNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentNo)  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentRecordResponse():
return $default(_that.paymentNo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentNo)?  $default,) {final _that = this;
switch (_that) {
case _CreatePaymentRecordResponse() when $default != null:
return $default(_that.paymentNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CreatePaymentRecordResponse implements CreatePaymentRecordResponse {
  const _CreatePaymentRecordResponse({required this.paymentNo});
  factory _CreatePaymentRecordResponse.fromJson(Map<String, dynamic> json) => _$CreatePaymentRecordResponseFromJson(json);

@override final  String paymentNo;

/// Create a copy of CreatePaymentRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CreatePaymentRecordResponseCopyWith<_CreatePaymentRecordResponse> get copyWith => __$CreatePaymentRecordResponseCopyWithImpl<_CreatePaymentRecordResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CreatePaymentRecordResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CreatePaymentRecordResponse&&(identical(other.paymentNo, paymentNo) || other.paymentNo == paymentNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentNo);

@override
String toString() {
  return 'CreatePaymentRecordResponse(paymentNo: $paymentNo)';
}


}

/// @nodoc
abstract mixin class _$CreatePaymentRecordResponseCopyWith<$Res> implements $CreatePaymentRecordResponseCopyWith<$Res> {
  factory _$CreatePaymentRecordResponseCopyWith(_CreatePaymentRecordResponse value, $Res Function(_CreatePaymentRecordResponse) _then) = __$CreatePaymentRecordResponseCopyWithImpl;
@override @useResult
$Res call({
 String paymentNo
});




}
/// @nodoc
class __$CreatePaymentRecordResponseCopyWithImpl<$Res>
    implements _$CreatePaymentRecordResponseCopyWith<$Res> {
  __$CreatePaymentRecordResponseCopyWithImpl(this._self, this._then);

  final _CreatePaymentRecordResponse _self;
  final $Res Function(_CreatePaymentRecordResponse) _then;

/// Create a copy of CreatePaymentRecordResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentNo = null,}) {
  return _then(_CreatePaymentRecordResponse(
paymentNo: null == paymentNo ? _self.paymentNo : paymentNo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$UpdatePaymentRecordRequest {

 String get paymentNo; String get accountToken; String get payTime; String get transactionId; int get payStatus;
/// Create a copy of UpdatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UpdatePaymentRecordRequestCopyWith<UpdatePaymentRecordRequest> get copyWith => _$UpdatePaymentRecordRequestCopyWithImpl<UpdatePaymentRecordRequest>(this as UpdatePaymentRecordRequest, _$identity);

  /// Serializes this UpdatePaymentRecordRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UpdatePaymentRecordRequest&&(identical(other.paymentNo, paymentNo) || other.paymentNo == paymentNo)&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&(identical(other.payTime, payTime) || other.payTime == payTime)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.payStatus, payStatus) || other.payStatus == payStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentNo,accountToken,payTime,transactionId,payStatus);

@override
String toString() {
  return 'UpdatePaymentRecordRequest(paymentNo: $paymentNo, accountToken: $accountToken, payTime: $payTime, transactionId: $transactionId, payStatus: $payStatus)';
}


}

/// @nodoc
abstract mixin class $UpdatePaymentRecordRequestCopyWith<$Res>  {
  factory $UpdatePaymentRecordRequestCopyWith(UpdatePaymentRecordRequest value, $Res Function(UpdatePaymentRecordRequest) _then) = _$UpdatePaymentRecordRequestCopyWithImpl;
@useResult
$Res call({
 String paymentNo, String accountToken, String payTime, String transactionId, int payStatus
});




}
/// @nodoc
class _$UpdatePaymentRecordRequestCopyWithImpl<$Res>
    implements $UpdatePaymentRecordRequestCopyWith<$Res> {
  _$UpdatePaymentRecordRequestCopyWithImpl(this._self, this._then);

  final UpdatePaymentRecordRequest _self;
  final $Res Function(UpdatePaymentRecordRequest) _then;

/// Create a copy of UpdatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentNo = null,Object? accountToken = null,Object? payTime = null,Object? transactionId = null,Object? payStatus = null,}) {
  return _then(_self.copyWith(
paymentNo: null == paymentNo ? _self.paymentNo : paymentNo // ignore: cast_nullable_to_non_nullable
as String,accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,payTime: null == payTime ? _self.payTime : payTime // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,payStatus: null == payStatus ? _self.payStatus : payStatus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [UpdatePaymentRecordRequest].
extension UpdatePaymentRecordRequestPatterns on UpdatePaymentRecordRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UpdatePaymentRecordRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UpdatePaymentRecordRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UpdatePaymentRecordRequest value)  $default,){
final _that = this;
switch (_that) {
case _UpdatePaymentRecordRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UpdatePaymentRecordRequest value)?  $default,){
final _that = this;
switch (_that) {
case _UpdatePaymentRecordRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentNo,  String accountToken,  String payTime,  String transactionId,  int payStatus)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UpdatePaymentRecordRequest() when $default != null:
return $default(_that.paymentNo,_that.accountToken,_that.payTime,_that.transactionId,_that.payStatus);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentNo,  String accountToken,  String payTime,  String transactionId,  int payStatus)  $default,) {final _that = this;
switch (_that) {
case _UpdatePaymentRecordRequest():
return $default(_that.paymentNo,_that.accountToken,_that.payTime,_that.transactionId,_that.payStatus);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentNo,  String accountToken,  String payTime,  String transactionId,  int payStatus)?  $default,) {final _that = this;
switch (_that) {
case _UpdatePaymentRecordRequest() when $default != null:
return $default(_that.paymentNo,_that.accountToken,_that.payTime,_that.transactionId,_that.payStatus);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UpdatePaymentRecordRequest implements UpdatePaymentRecordRequest {
  const _UpdatePaymentRecordRequest({required this.paymentNo, required this.accountToken, required this.payTime, required this.transactionId, required this.payStatus});
  factory _UpdatePaymentRecordRequest.fromJson(Map<String, dynamic> json) => _$UpdatePaymentRecordRequestFromJson(json);

@override final  String paymentNo;
@override final  String accountToken;
@override final  String payTime;
@override final  String transactionId;
@override final  int payStatus;

/// Create a copy of UpdatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UpdatePaymentRecordRequestCopyWith<_UpdatePaymentRecordRequest> get copyWith => __$UpdatePaymentRecordRequestCopyWithImpl<_UpdatePaymentRecordRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UpdatePaymentRecordRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UpdatePaymentRecordRequest&&(identical(other.paymentNo, paymentNo) || other.paymentNo == paymentNo)&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&(identical(other.payTime, payTime) || other.payTime == payTime)&&(identical(other.transactionId, transactionId) || other.transactionId == transactionId)&&(identical(other.payStatus, payStatus) || other.payStatus == payStatus));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentNo,accountToken,payTime,transactionId,payStatus);

@override
String toString() {
  return 'UpdatePaymentRecordRequest(paymentNo: $paymentNo, accountToken: $accountToken, payTime: $payTime, transactionId: $transactionId, payStatus: $payStatus)';
}


}

/// @nodoc
abstract mixin class _$UpdatePaymentRecordRequestCopyWith<$Res> implements $UpdatePaymentRecordRequestCopyWith<$Res> {
  factory _$UpdatePaymentRecordRequestCopyWith(_UpdatePaymentRecordRequest value, $Res Function(_UpdatePaymentRecordRequest) _then) = __$UpdatePaymentRecordRequestCopyWithImpl;
@override @useResult
$Res call({
 String paymentNo, String accountToken, String payTime, String transactionId, int payStatus
});




}
/// @nodoc
class __$UpdatePaymentRecordRequestCopyWithImpl<$Res>
    implements _$UpdatePaymentRecordRequestCopyWith<$Res> {
  __$UpdatePaymentRecordRequestCopyWithImpl(this._self, this._then);

  final _UpdatePaymentRecordRequest _self;
  final $Res Function(_UpdatePaymentRecordRequest) _then;

/// Create a copy of UpdatePaymentRecordRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentNo = null,Object? accountToken = null,Object? payTime = null,Object? transactionId = null,Object? payStatus = null,}) {
  return _then(_UpdatePaymentRecordRequest(
paymentNo: null == paymentNo ? _self.paymentNo : paymentNo // ignore: cast_nullable_to_non_nullable
as String,accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,payTime: null == payTime ? _self.payTime : payTime // ignore: cast_nullable_to_non_nullable
as String,transactionId: null == transactionId ? _self.transactionId : transactionId // ignore: cast_nullable_to_non_nullable
as String,payStatus: null == payStatus ? _self.payStatus : payStatus // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PaymentRecord {

 String get paymentNo; String get createTime; String get payTime; int get payStatus; int get quantity;
/// Create a copy of PaymentRecord
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentRecordCopyWith<PaymentRecord> get copyWith => _$PaymentRecordCopyWithImpl<PaymentRecord>(this as PaymentRecord, _$identity);

  /// Serializes this PaymentRecord to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentRecord&&(identical(other.paymentNo, paymentNo) || other.paymentNo == paymentNo)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.payTime, payTime) || other.payTime == payTime)&&(identical(other.payStatus, payStatus) || other.payStatus == payStatus)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentNo,createTime,payTime,payStatus,quantity);

@override
String toString() {
  return 'PaymentRecord(paymentNo: $paymentNo, createTime: $createTime, payTime: $payTime, payStatus: $payStatus, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class $PaymentRecordCopyWith<$Res>  {
  factory $PaymentRecordCopyWith(PaymentRecord value, $Res Function(PaymentRecord) _then) = _$PaymentRecordCopyWithImpl;
@useResult
$Res call({
 String paymentNo, String createTime, String payTime, int payStatus, int quantity
});




}
/// @nodoc
class _$PaymentRecordCopyWithImpl<$Res>
    implements $PaymentRecordCopyWith<$Res> {
  _$PaymentRecordCopyWithImpl(this._self, this._then);

  final PaymentRecord _self;
  final $Res Function(PaymentRecord) _then;

/// Create a copy of PaymentRecord
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? paymentNo = null,Object? createTime = null,Object? payTime = null,Object? payStatus = null,Object? quantity = null,}) {
  return _then(_self.copyWith(
paymentNo: null == paymentNo ? _self.paymentNo : paymentNo // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,payTime: null == payTime ? _self.payTime : payTime // ignore: cast_nullable_to_non_nullable
as String,payStatus: null == payStatus ? _self.payStatus : payStatus // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentRecord].
extension PaymentRecordPatterns on PaymentRecord {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentRecord value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentRecord() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentRecord value)  $default,){
final _that = this;
switch (_that) {
case _PaymentRecord():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentRecord value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentRecord() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String paymentNo,  String createTime,  String payTime,  int payStatus,  int quantity)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentRecord() when $default != null:
return $default(_that.paymentNo,_that.createTime,_that.payTime,_that.payStatus,_that.quantity);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String paymentNo,  String createTime,  String payTime,  int payStatus,  int quantity)  $default,) {final _that = this;
switch (_that) {
case _PaymentRecord():
return $default(_that.paymentNo,_that.createTime,_that.payTime,_that.payStatus,_that.quantity);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String paymentNo,  String createTime,  String payTime,  int payStatus,  int quantity)?  $default,) {final _that = this;
switch (_that) {
case _PaymentRecord() when $default != null:
return $default(_that.paymentNo,_that.createTime,_that.payTime,_that.payStatus,_that.quantity);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentRecord implements PaymentRecord {
  const _PaymentRecord({required this.paymentNo, required this.createTime, required this.payTime, required this.payStatus, required this.quantity});
  factory _PaymentRecord.fromJson(Map<String, dynamic> json) => _$PaymentRecordFromJson(json);

@override final  String paymentNo;
@override final  String createTime;
@override final  String payTime;
@override final  int payStatus;
@override final  int quantity;

/// Create a copy of PaymentRecord
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentRecordCopyWith<_PaymentRecord> get copyWith => __$PaymentRecordCopyWithImpl<_PaymentRecord>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentRecordToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentRecord&&(identical(other.paymentNo, paymentNo) || other.paymentNo == paymentNo)&&(identical(other.createTime, createTime) || other.createTime == createTime)&&(identical(other.payTime, payTime) || other.payTime == payTime)&&(identical(other.payStatus, payStatus) || other.payStatus == payStatus)&&(identical(other.quantity, quantity) || other.quantity == quantity));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,paymentNo,createTime,payTime,payStatus,quantity);

@override
String toString() {
  return 'PaymentRecord(paymentNo: $paymentNo, createTime: $createTime, payTime: $payTime, payStatus: $payStatus, quantity: $quantity)';
}


}

/// @nodoc
abstract mixin class _$PaymentRecordCopyWith<$Res> implements $PaymentRecordCopyWith<$Res> {
  factory _$PaymentRecordCopyWith(_PaymentRecord value, $Res Function(_PaymentRecord) _then) = __$PaymentRecordCopyWithImpl;
@override @useResult
$Res call({
 String paymentNo, String createTime, String payTime, int payStatus, int quantity
});




}
/// @nodoc
class __$PaymentRecordCopyWithImpl<$Res>
    implements _$PaymentRecordCopyWith<$Res> {
  __$PaymentRecordCopyWithImpl(this._self, this._then);

  final _PaymentRecord _self;
  final $Res Function(_PaymentRecord) _then;

/// Create a copy of PaymentRecord
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? paymentNo = null,Object? createTime = null,Object? payTime = null,Object? payStatus = null,Object? quantity = null,}) {
  return _then(_PaymentRecord(
paymentNo: null == paymentNo ? _self.paymentNo : paymentNo // ignore: cast_nullable_to_non_nullable
as String,createTime: null == createTime ? _self.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String,payTime: null == payTime ? _self.payTime : payTime // ignore: cast_nullable_to_non_nullable
as String,payStatus: null == payStatus ? _self.payStatus : payStatus // ignore: cast_nullable_to_non_nullable
as int,quantity: null == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GetPaymentListRequest {

 int get start; int get end; String get accountToken;
/// Create a copy of GetPaymentListRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPaymentListRequestCopyWith<GetPaymentListRequest> get copyWith => _$GetPaymentListRequestCopyWithImpl<GetPaymentListRequest>(this as GetPaymentListRequest, _$identity);

  /// Serializes this GetPaymentListRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPaymentListRequest&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,accountToken);

@override
String toString() {
  return 'GetPaymentListRequest(start: $start, end: $end, accountToken: $accountToken)';
}


}

/// @nodoc
abstract mixin class $GetPaymentListRequestCopyWith<$Res>  {
  factory $GetPaymentListRequestCopyWith(GetPaymentListRequest value, $Res Function(GetPaymentListRequest) _then) = _$GetPaymentListRequestCopyWithImpl;
@useResult
$Res call({
 int start, int end, String accountToken
});




}
/// @nodoc
class _$GetPaymentListRequestCopyWithImpl<$Res>
    implements $GetPaymentListRequestCopyWith<$Res> {
  _$GetPaymentListRequestCopyWithImpl(this._self, this._then);

  final GetPaymentListRequest _self;
  final $Res Function(GetPaymentListRequest) _then;

/// Create a copy of GetPaymentListRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? start = null,Object? end = null,Object? accountToken = null,}) {
  return _then(_self.copyWith(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as int,accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPaymentListRequest].
extension GetPaymentListRequestPatterns on GetPaymentListRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPaymentListRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPaymentListRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPaymentListRequest value)  $default,){
final _that = this;
switch (_that) {
case _GetPaymentListRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPaymentListRequest value)?  $default,){
final _that = this;
switch (_that) {
case _GetPaymentListRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int start,  int end,  String accountToken)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPaymentListRequest() when $default != null:
return $default(_that.start,_that.end,_that.accountToken);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int start,  int end,  String accountToken)  $default,) {final _that = this;
switch (_that) {
case _GetPaymentListRequest():
return $default(_that.start,_that.end,_that.accountToken);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int start,  int end,  String accountToken)?  $default,) {final _that = this;
switch (_that) {
case _GetPaymentListRequest() when $default != null:
return $default(_that.start,_that.end,_that.accountToken);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPaymentListRequest implements GetPaymentListRequest {
  const _GetPaymentListRequest({required this.start, required this.end, required this.accountToken});
  factory _GetPaymentListRequest.fromJson(Map<String, dynamic> json) => _$GetPaymentListRequestFromJson(json);

@override final  int start;
@override final  int end;
@override final  String accountToken;

/// Create a copy of GetPaymentListRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPaymentListRequestCopyWith<_GetPaymentListRequest> get copyWith => __$GetPaymentListRequestCopyWithImpl<_GetPaymentListRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPaymentListRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPaymentListRequest&&(identical(other.start, start) || other.start == start)&&(identical(other.end, end) || other.end == end)&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,start,end,accountToken);

@override
String toString() {
  return 'GetPaymentListRequest(start: $start, end: $end, accountToken: $accountToken)';
}


}

/// @nodoc
abstract mixin class _$GetPaymentListRequestCopyWith<$Res> implements $GetPaymentListRequestCopyWith<$Res> {
  factory _$GetPaymentListRequestCopyWith(_GetPaymentListRequest value, $Res Function(_GetPaymentListRequest) _then) = __$GetPaymentListRequestCopyWithImpl;
@override @useResult
$Res call({
 int start, int end, String accountToken
});




}
/// @nodoc
class __$GetPaymentListRequestCopyWithImpl<$Res>
    implements _$GetPaymentListRequestCopyWith<$Res> {
  __$GetPaymentListRequestCopyWithImpl(this._self, this._then);

  final _GetPaymentListRequest _self;
  final $Res Function(_GetPaymentListRequest) _then;

/// Create a copy of GetPaymentListRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? start = null,Object? end = null,Object? accountToken = null,}) {
  return _then(_GetPaymentListRequest(
start: null == start ? _self.start : start // ignore: cast_nullable_to_non_nullable
as int,end: null == end ? _self.end : end // ignore: cast_nullable_to_non_nullable
as int,accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$GetPaymentListResponse {

 String get accountToken; List<PaymentRecord> get paymentRecords;
/// Create a copy of GetPaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetPaymentListResponseCopyWith<GetPaymentListResponse> get copyWith => _$GetPaymentListResponseCopyWithImpl<GetPaymentListResponse>(this as GetPaymentListResponse, _$identity);

  /// Serializes this GetPaymentListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetPaymentListResponse&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&const DeepCollectionEquality().equals(other.paymentRecords, paymentRecords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountToken,const DeepCollectionEquality().hash(paymentRecords));

@override
String toString() {
  return 'GetPaymentListResponse(accountToken: $accountToken, paymentRecords: $paymentRecords)';
}


}

/// @nodoc
abstract mixin class $GetPaymentListResponseCopyWith<$Res>  {
  factory $GetPaymentListResponseCopyWith(GetPaymentListResponse value, $Res Function(GetPaymentListResponse) _then) = _$GetPaymentListResponseCopyWithImpl;
@useResult
$Res call({
 String accountToken, List<PaymentRecord> paymentRecords
});




}
/// @nodoc
class _$GetPaymentListResponseCopyWithImpl<$Res>
    implements $GetPaymentListResponseCopyWith<$Res> {
  _$GetPaymentListResponseCopyWithImpl(this._self, this._then);

  final GetPaymentListResponse _self;
  final $Res Function(GetPaymentListResponse) _then;

/// Create a copy of GetPaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountToken = null,Object? paymentRecords = null,}) {
  return _then(_self.copyWith(
accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,paymentRecords: null == paymentRecords ? _self.paymentRecords : paymentRecords // ignore: cast_nullable_to_non_nullable
as List<PaymentRecord>,
  ));
}

}


/// Adds pattern-matching-related methods to [GetPaymentListResponse].
extension GetPaymentListResponsePatterns on GetPaymentListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetPaymentListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetPaymentListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetPaymentListResponse value)  $default,){
final _that = this;
switch (_that) {
case _GetPaymentListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetPaymentListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _GetPaymentListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String accountToken,  List<PaymentRecord> paymentRecords)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetPaymentListResponse() when $default != null:
return $default(_that.accountToken,_that.paymentRecords);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String accountToken,  List<PaymentRecord> paymentRecords)  $default,) {final _that = this;
switch (_that) {
case _GetPaymentListResponse():
return $default(_that.accountToken,_that.paymentRecords);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String accountToken,  List<PaymentRecord> paymentRecords)?  $default,) {final _that = this;
switch (_that) {
case _GetPaymentListResponse() when $default != null:
return $default(_that.accountToken,_that.paymentRecords);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetPaymentListResponse implements GetPaymentListResponse {
  const _GetPaymentListResponse({required this.accountToken, required final  List<PaymentRecord> paymentRecords}): _paymentRecords = paymentRecords;
  factory _GetPaymentListResponse.fromJson(Map<String, dynamic> json) => _$GetPaymentListResponseFromJson(json);

@override final  String accountToken;
 final  List<PaymentRecord> _paymentRecords;
@override List<PaymentRecord> get paymentRecords {
  if (_paymentRecords is EqualUnmodifiableListView) return _paymentRecords;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_paymentRecords);
}


/// Create a copy of GetPaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetPaymentListResponseCopyWith<_GetPaymentListResponse> get copyWith => __$GetPaymentListResponseCopyWithImpl<_GetPaymentListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetPaymentListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetPaymentListResponse&&(identical(other.accountToken, accountToken) || other.accountToken == accountToken)&&const DeepCollectionEquality().equals(other._paymentRecords, _paymentRecords));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountToken,const DeepCollectionEquality().hash(_paymentRecords));

@override
String toString() {
  return 'GetPaymentListResponse(accountToken: $accountToken, paymentRecords: $paymentRecords)';
}


}

/// @nodoc
abstract mixin class _$GetPaymentListResponseCopyWith<$Res> implements $GetPaymentListResponseCopyWith<$Res> {
  factory _$GetPaymentListResponseCopyWith(_GetPaymentListResponse value, $Res Function(_GetPaymentListResponse) _then) = __$GetPaymentListResponseCopyWithImpl;
@override @useResult
$Res call({
 String accountToken, List<PaymentRecord> paymentRecords
});




}
/// @nodoc
class __$GetPaymentListResponseCopyWithImpl<$Res>
    implements _$GetPaymentListResponseCopyWith<$Res> {
  __$GetPaymentListResponseCopyWithImpl(this._self, this._then);

  final _GetPaymentListResponse _self;
  final $Res Function(_GetPaymentListResponse) _then;

/// Create a copy of GetPaymentListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountToken = null,Object? paymentRecords = null,}) {
  return _then(_GetPaymentListResponse(
accountToken: null == accountToken ? _self.accountToken : accountToken // ignore: cast_nullable_to_non_nullable
as String,paymentRecords: null == paymentRecords ? _self._paymentRecords : paymentRecords // ignore: cast_nullable_to_non_nullable
as List<PaymentRecord>,
  ));
}


}

// dart format on
