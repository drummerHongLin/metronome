
import 'package:flutter/services.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/third_pay.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';

import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
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

    // 1. 创建购买单据
    final payRes =  await _payService.createPayment(
      CreatePaymentRecordRequest(
        accountToken: token,
        createTime: DateFormat('yyyy-MM-dd hh:mm:ss').format(DateTime.now()),
        productName: product.name,
        quantity: quantity,
        amount: (quantity * product.price).toDouble(),
      ),
    );

    // 2.调用支付接口

    try {
      final thirdPayRes = await _thirdPayService.invokePurchase(quantity, token);
      _payService.updatePayment(UpdatePaymentRecordRequest(paymentNo: payRes.paymentNo,
      accountToken: token, payTime: thirdPayRes.purchaseDate, 
      transactionId: thirdPayRes.transactionId, payStatus: 3));
    } on PlatformException catch(e){
      await _payService.updatePayment(UpdatePaymentRecordRequest(paymentNo: payRes.paymentNo,
       accountToken: token, payTime: "", 
       transactionId: "", payStatus: 4));
      return Failure("三方支付调用失败!",e);
    }
    on Exception catch(e){
      return Failure("平台支付记录失败!",e);
    }

    return Success(null);

  }
}
