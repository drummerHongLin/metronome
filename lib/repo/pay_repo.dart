import 'package:flutter/services.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/repo/model/payment.dart';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/third_pay.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/services/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/utils/result.dart';
import 'package:intl/intl.dart';

class PayRepo {
  final PayService _payService;
  final SharedPreferencesService _preferencesService;
  final ThirdPayService _thirdPayService;

  PayRepo({
    required PayService payService,
    required SharedPreferencesService preferencesService,
    required ThirdPayService thirdPayService,
  }) : _payService = payService,
       _preferencesService = preferencesService,
       _thirdPayService = thirdPayService;

  Future<Result<void>> purchaseProduct(Product product, int quantity) async {
    final token = await _preferencesService.accountToken;
    final CreatePaymentRecordResponse payRes;
    try {
      // 1. 创建购买单据
      payRes = await _payService.createPayment(
        CreatePaymentRecordRequest(
          accountToken: token,
          createTime: DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
          productName: product.name,
          quantity: quantity,
          price: product.price.toDouble(),
          amount: (quantity * product.price).toDouble(),
        ),
      );
    } on Exception catch (e) {
      return Failure("平台支付记录失败!", e);
    }

    // 2.调用支付接口
    try {
      final thirdPayRes = await _thirdPayService.invokePurchase(
        quantity,
        token,
      );
      _payService.updatePayment(
        UpdatePaymentRecordRequest(
          paymentNo: payRes.paymentNo,
          accountToken: token,
          payTime: thirdPayRes.purchaseDate.toString(),
          transactionId: thirdPayRes.transactionId,
          payStatus: 3,
        ),
      );
    } on PlatformException catch (e) {
      await _payService.updatePayment(
        UpdatePaymentRecordRequest(
          paymentNo: payRes.paymentNo,
          accountToken: token,
          payTime: "",
          transactionId: "",
          payStatus: 4,
        ),
      );
      return Failure("三方支付调用失败!", e);
    } on Exception catch (e) {
      return Failure("平台支付记录失败!", e);
    }

    return Success(null);
  }

  Future<Result<List<Payment>>> getPaymentList(int offset, int limit) async {
    try {
      final token = await _preferencesService.accountToken;
      final rst = await _payService.getPaymentList(
        GetPaymentListRequest(start: offset, end: limit, accountToken: token),
      );
      final list = rst.paymentRecords;
      return Success(list.map((e) => Payment.fromService(e)).toList());
    } on Exception catch (e) {
      return Failure("获取支付记录失败！", e);
    }
  }
}
