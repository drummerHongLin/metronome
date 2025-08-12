import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/third_pay.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/model/third_pay/third_pay_data.dart';
import 'package:flutter_metronome/service/sql_lite/sql_lite.dart';
import 'package:intl/intl.dart';

class NativeChannel implements ThirdPayService {
  NativeChannel._() {
    _channel = MethodChannel("com.jinghong.metronome/purchase");
  }

  static final _instance = NativeChannel._();

  static NativeChannel get instance => _instance;

  late final MethodChannel _channel;

  // 暂时先不考虑登录的情况
  late final PayService _payClient = PayDbClient();

  // 用于后续登录切换用
  void setPayClient() {}

  // 主动调用逻辑
  // 暂时先不考虑安卓系统的通用
  @override
  Future<TransactionInfo> invokePurchase(int quantity, String token) async {
    final args = jsonEncode({
      'accountId': token, // 用于关联用户信息
      'quantity': quantity,
    });

    final rst = await _channel.invokeMethod<String>('invokePurchase', args);
    // 端口传来的是
    List<int> decodedBytes = base64Decode(rst!);

    // 2. 将字节转为 UTF-8 字符串
    String jsonStr = utf8.decode(decodedBytes);

    Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    final transactionInfo = TransactionInfo.fromJson(jsonMap);

    return transactionInfo;
  }

  // 监听逻辑
  void setUpChannel() {
    _channel.setMethodCallHandler((handler) async {
      if (handler.method == "updateTransaction") {
        final args = handler.arguments;
        final rst = await handleUpdateTransaction(args);
        return rst;
      } else {
        throw PlatformException(
          code: "Method Not Found",
          message: handler.method,
        );
      }
    });
  }

  Future<bool> handleUpdateTransaction(dynamic arguments) async {
    final rst = arguments;
    List<int> decodedBytes = base64Decode(rst);
    String jsonStr = utf8.decode(decodedBytes);
    Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    final transactionInfo = TransactionInfo.fromJson(jsonMap);

    final CreatePaymentRecordResponse payRes;
    try {
      // 1. 创建购买单据
      payRes = await _payClient.createPayment(
        CreatePaymentRecordRequest(
          accountToken: transactionInfo.appAccountToken,
          createTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            DateTime.fromMillisecondsSinceEpoch(transactionInfo.purchaseDate),
          ),
          productName: "123",
          quantity: transactionInfo.quantity,
          amount: (transactionInfo.quantity * transactionInfo.price) / 1000,
        ),
      );
    } on Exception catch (_) {
      return false;
    }

    // 2. 更新订单信息
    try {
      _payClient.updatePayment(
        UpdatePaymentRecordRequest(
          paymentNo: payRes.paymentNo,
          accountToken: transactionInfo.appAccountToken,
          payTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(
            DateTime.fromMillisecondsSinceEpoch(transactionInfo.purchaseDate),
          ),
          transactionId: transactionInfo.transactionId,
          payStatus: 3,
        ),
      );
    } on PlatformException catch (_) {
      await _payClient.updatePayment(
        UpdatePaymentRecordRequest(
          paymentNo: payRes.paymentNo,
          accountToken: transactionInfo.appAccountToken,
          payTime: "",
          transactionId: "",
          payStatus: 4,
        ),
      );
      return false;
    } on Exception catch (_) {
      return false;
    }
    return true;
  }
}
