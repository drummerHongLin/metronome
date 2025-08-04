import 'package:flutter_metronome/service/model/third_pay/third_pay_data.dart';

abstract class ThirdPayService {

   Future<TransactionInfo> invokePurchase(int quantity,String token);

}