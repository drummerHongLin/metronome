import 'package:flutter/foundation.dart';
import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/repo/pay_repo.dart';
import 'package:flutter_metronome/utils/command.dart';
import 'package:flutter_metronome/utils/result.dart';

class SponsorshipViewModel {
  final PayRepo _payRepo;
  final ValueNotifier<String> msg = ValueNotifier("");

  late final Command2<void, Product, int> invokePurchase;

  SponsorshipViewModel({required PayRepo payRepo}) : _payRepo = payRepo {
    invokePurchase = Command2(_invokePurchase);
  }

  Future<Result<void>> _invokePurchase(Product product, int quantity) async {
    final rst = await _payRepo.purchaseProduct(product, quantity);
    rst.when(
      success: (v) => msg.value = "支付成功！感谢支持🙏",
      failure: (m, _) => msg.value = m,
    );
    return rst;
  }
}
