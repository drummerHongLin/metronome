// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pay_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreatePaymentRecordRequest _$CreatePaymentRecordRequestFromJson(
  Map<String, dynamic> json,
) => _CreatePaymentRecordRequest(
  accountToken: json['accountToken'] as String,
  createTime: json['createTime'] as String,
  productName: json['productName'] as String,
  quantity: (json['quantity'] as num).toInt(),
  amount: (json['amount'] as num).toDouble(),
);

Map<String, dynamic> _$CreatePaymentRecordRequestToJson(
  _CreatePaymentRecordRequest instance,
) => <String, dynamic>{
  'accountToken': instance.accountToken,
  'createTime': instance.createTime,
  'productName': instance.productName,
  'quantity': instance.quantity,
  'amount': instance.amount,
};

_CreatePaymentRecordResponse _$CreatePaymentRecordResponseFromJson(
  Map<String, dynamic> json,
) => _CreatePaymentRecordResponse(paymentNo: json['paymentNo'] as String);

Map<String, dynamic> _$CreatePaymentRecordResponseToJson(
  _CreatePaymentRecordResponse instance,
) => <String, dynamic>{'paymentNo': instance.paymentNo};

_UpdatePaymentRecordRequest _$UpdatePaymentRecordRequestFromJson(
  Map<String, dynamic> json,
) => _UpdatePaymentRecordRequest(
  paymentNo: json['paymentNo'] as String,
  accountToken: json['accountToken'] as String,
  payTime: json['payTime'] as String,
  transactionId: json['transactionId'] as String,
  payStatus: (json['payStatus'] as num).toInt(),
);

Map<String, dynamic> _$UpdatePaymentRecordRequestToJson(
  _UpdatePaymentRecordRequest instance,
) => <String, dynamic>{
  'paymentNo': instance.paymentNo,
  'accountToken': instance.accountToken,
  'payTime': instance.payTime,
  'transactionId': instance.transactionId,
  'payStatus': instance.payStatus,
};

_PaymentRecord _$PaymentRecordFromJson(Map<String, dynamic> json) =>
    _PaymentRecord(
      paymentNo: json['paymentNo'] as String,
      createTime: json['createTime'] as String,
      payTime: json['payTime'] as String,
      payStatus: (json['payStatus'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$PaymentRecordToJson(_PaymentRecord instance) =>
    <String, dynamic>{
      'paymentNo': instance.paymentNo,
      'createTime': instance.createTime,
      'payTime': instance.payTime,
      'payStatus': instance.payStatus,
      'quantity': instance.quantity,
    };

_GetPaymentListRequest _$GetPaymentListRequestFromJson(
  Map<String, dynamic> json,
) => _GetPaymentListRequest(
  start: (json['start'] as num).toInt(),
  end: (json['end'] as num).toInt(),
  accountToken: json['accountToken'] as String,
);

Map<String, dynamic> _$GetPaymentListRequestToJson(
  _GetPaymentListRequest instance,
) => <String, dynamic>{
  'start': instance.start,
  'end': instance.end,
  'accountToken': instance.accountToken,
};

_GetPaymentListResponse _$GetPaymentListResponseFromJson(
  Map<String, dynamic> json,
) => _GetPaymentListResponse(
  accountToken: json['accountToken'] as String,
  paymentRecords:
      (json['paymentRecords'] as List<dynamic>)
          .map((e) => PaymentRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$GetPaymentListResponseToJson(
  _GetPaymentListResponse instance,
) => <String, dynamic>{
  'accountToken': instance.accountToken,
  'paymentRecords': instance.paymentRecords,
};
