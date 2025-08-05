// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_pay_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionInfo _$TransactionInfoFromJson(Map<String, dynamic> json) =>
    _TransactionInfo(
      appAccountToken: json['appAccountToken'] as String,
      purchaseDate: (json['purchaseDate'] as num).toInt(),
      transactionId: json['transactionId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionInfoToJson(_TransactionInfo instance) =>
    <String, dynamic>{
      'appAccountToken': instance.appAccountToken,
      'purchaseDate': instance.purchaseDate,
      'transactionId': instance.transactionId,
      'quantity': instance.quantity,
      'price': instance.price,
    };
