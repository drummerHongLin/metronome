



import 'package:freezed_annotation/freezed_annotation.dart';


part 'third_pay_data.g.dart';
part 'third_pay_data.freezed.dart';

@freezed
abstract class TransactionInfo with _$TransactionInfo {
  const factory TransactionInfo({
    required String appAccountToken,
    required int purchaseDate,
    required String transactionId,
    required int quantity,
    required int price
  }) = _TransactionInfo;

  factory TransactionInfo.fromJson(Map<String,dynamic> json) => _$TransactionInfoFromJson(json);

}