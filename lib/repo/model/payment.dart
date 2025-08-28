import 'package:flutter_metronome/service/model/pay/pay_data.dart';

class Payment {
  final String paymentNo;
  final String createTime;
  final String payStatus;
  final int quantity;
  final double amount;
  final double price;

  Payment({
    required this.paymentNo,
    required this.createTime,
    required this.payStatus,
    required this.quantity,
    required this.amount,
    required this.price,
  });

  factory Payment.fromService(PaymentRecord r) {
    return Payment(
      paymentNo: r.paymentNo,
      createTime: r.createTime,
      payStatus: switch (r.payStatus) {
        1 => '已创建',
        3 => '支付成功',
        4 => '支付失败',
        _ => '未知',
      },
      quantity: r.quantity,
      amount: r.amount,
      price: r.price,
    );
  }
}
