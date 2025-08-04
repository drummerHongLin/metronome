// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'third_pay_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionInfo _$TransactionInfoFromJson(Map<String, dynamic> json) =>
    _TransactionInfo(
      accountToken: json['accountToken'] as String,
      purchaseDate: json['purchaseDate'] as String,
      transactionId: json['transactionId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      price: (json['price'] as num).toInt(),
    );

Map<String, dynamic> _$TransactionInfoToJson(_TransactionInfo instance) =>
    <String, dynamic>{
      'accountToken': instance.accountToken,
      'purchaseDate': instance.purchaseDate,
      'transactionId': instance.transactionId,
      'quantity': instance.quantity,
      'price': instance.price,
    };
