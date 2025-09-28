
import 'package:flutter/foundation.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/repo/model/payment.dart';
import 'package:flutter_metronome/repo/pay_repo.dart';
import 'package:flutter_metronome/utils/command.dart';
import 'package:flutter_metronome/utils/result.dart';

class SponsorshipViewModel {
  final PayRepo _payRepo;
  final ValueNotifier<String> msg = ValueNotifier("");
  final ValueNotifier<List<Payment>> payments = ValueNotifier([]);
  final ValueNotifier<bool> hasMore = ValueNotifier(true);

  final int limit = 5;
  

  late final Command2<void, Product, int> invokePurchase;
  late final Command0<void> getPaymentList;

  SponsorshipViewModel({required PayRepo payRepo}) : _payRepo = payRepo {
    invokePurchase = Command2(_invokePurchase);
    getPaymentList = Command0(_getPaymentList);
  }

  Future<Result<void>> _invokePurchase(Product product, int quantity) async {
    final rst = await _payRepo.purchaseProduct(product, quantity);
    rst.when(
      success: (v) => msg.value = "支付成功！感谢支持🙏",
      failure: (m, _) => msg.value = m,
    );
    hasMore.value = true;
    return rst;
  }

  Future<Result<void>> _getPaymentList() async {
    final rst = await _payRepo.getPaymentList(payments.value.length,limit);
    rst.when(success: (data) {
      payments.value = [...payments.value,...data];
      if(data.length<limit) hasMore.value = false;
    },failure: (message, error) {
      
    },);
    return rst;
  }



  

}
