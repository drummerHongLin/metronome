import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_metronome/service/interface/third_pay.dart';
import 'package:flutter_metronome/service/model/third_pay/third_pay_data.dart';

mixin _NativeChannel {
  static final  MethodChannel _purchaseChannel = MethodChannel(
    "com.jinghong.metronome/purchase",
  );
  MethodChannel get purchaseChannel => _purchaseChannel;
}

class ThirdPayNCService extends ThirdPayService with _NativeChannel {

  // 单例对象
  ThirdPayNCService._();

  static final _instance = ThirdPayNCService._();

  static ThirdPayNCService get instance => _instance;


  // 主动调用逻辑
  // 暂时先不考虑安卓系统的通用
  @override
  Future<TransactionInfo> invokePurchase(int quantity, String token) async {



    final args = jsonEncode({
      'accountId': token, // 用于关联用户信息
      'quantity': quantity,
    });

    final channel = purchaseChannel;

    final rst = await channel.invokeMethod<String>('invokePurchase', args);
    // 端口传来的是
    List<int> decodedBytes = base64Decode(rst!);

    // 2. 将字节转为 UTF-8 字符串
    String jsonStr = utf8.decode(decodedBytes);

    Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
    final transactionInfo = TransactionInfo.fromJson(jsonMap);

    return transactionInfo;
  }

  // 监听逻辑
  @override
  void setUpChannel(Future<bool> Function(dynamic arguments) updateHandler) {
    final channel = purchaseChannel;
    channel.setMethodCallHandler((handler) async {
      if (handler.method == "updateTransaction") {
        final args = handler.arguments;
        final rst = await updateHandler(args);
        return rst;
      } else {
        throw PlatformException(
          code: "Method Not Found",
          message: handler.method,
        );
      }
    });
  }
}
