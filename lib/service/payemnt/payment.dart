import 'package:flutter/services.dart';

class Payment {

  static const platform = MethodChannel('com.jinghong.metronome/payment');

  Future<bool> invokePayment(String label, String amount) async {
    try{
      final rst = await platform.invokeMethod<bool>('invokePayment',
       );
      return rst??false;
    }
    on Exception {
      return false;
    }

  }

}