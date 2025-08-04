
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_metronome/service/interface/third_pay.dart';
import 'package:flutter_metronome/service/model/third_pay/third_pay_data.dart';


class NativeChannel implements ThirdPayService {

    NativeChannel._(){
      _channel = MethodChannel("com.jinghong.metronome/purchase");
    }
    
    static final  _instance = NativeChannel._();

    static NativeChannel get instance => _instance;

    late final MethodChannel _channel;



    // 暂时先不考虑安卓系统的通用
    @override
      Future<TransactionInfo> invokePurchase(int quantity,String token) async{
      final args = jsonEncode({
      'accountId': token, // 用于关联用户信息
      'quantity':quantity
      })    ;

      final rst = await _channel.invokeMethod<String>('invokePurchase', args);
      // 端口传来的是
      List<int> decodedBytes = base64Decode(rst!);

      // 2. 将字节转为 UTF-8 字符串
      String jsonStr = utf8.decode(decodedBytes);

      Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
      final transactionInfo = TransactionInfo.fromJson(jsonMap);
      
      return transactionInfo;
    }

}