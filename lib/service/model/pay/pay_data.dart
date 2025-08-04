

import 'package:freezed_annotation/freezed_annotation.dart';

part 'pay_data.g.dart';
part 'pay_data.freezed.dart';


@freezed
abstract class CreatePaymentRecordRequest with _$CreatePaymentRecordRequest {
  const factory CreatePaymentRecordRequest({
    required String accountToken,
    required String createTime,
    required String productName,
    required int quantity,
    required double amount
  }) = _CreatePaymentRecordRequest;

  factory CreatePaymentRecordRequest.fromJson(Map<String,dynamic> json) => _$CreatePaymentRecordRequestFromJson(json);

}



@freezed
abstract class CreatePaymentRecordResponse with _$CreatePaymentRecordResponse {
  const factory CreatePaymentRecordResponse({
    required String paymentNo,
  }) = _CreatePaymentRecordResponse;

  factory CreatePaymentRecordResponse.fromJson(Map<String,dynamic> json) => _$CreatePaymentRecordResponseFromJson(json);

}


@freezed
abstract class UpdatePaymentRecordRequest with _$UpdatePaymentRecordRequest {
  const factory UpdatePaymentRecordRequest({
    required String paymentNo,
    required String accountToken,
    required String payTime,
    required String transactionId,
    required int payStatus,

  }) = _UpdatePaymentRecordRequest;

  factory UpdatePaymentRecordRequest.fromJson(Map<String,dynamic> json) => _$UpdatePaymentRecordRequestFromJson(json);

}




@freezed
abstract class PaymentRecord with _$PaymentRecord {
  const factory PaymentRecord({
    required String paymentNo,
    required String createTime,
    required String payTime,
    required int payStatus,
    required int quantity
  }) = _PaymentRecord;

  factory PaymentRecord.fromJson(Map<String,dynamic> json) => _$PaymentRecordFromJson(json);

}


@freezed
abstract class GetPaymentListRequest with _$GetPaymentListRequest {
  const factory GetPaymentListRequest({
    required int start,
    required int end,
    required String accountToken
  }) = _GetPaymentListRequest;

  factory GetPaymentListRequest.fromJson(Map<String,dynamic> json) => _$GetPaymentListRequestFromJson(json);

}



@freezed
abstract class GetPaymentListResponse with _$GetPaymentListResponse {
  const factory GetPaymentListResponse({
    required String accountToken,
    required List<PaymentRecord> paymentRecords
  }) = _GetPaymentListResponse;

  factory GetPaymentListResponse.fromJson(Map<String,dynamic> json) => _$GetPaymentListResponseFromJson(json);

}