import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/model/third_pay/third_pay_data.dart';
import 'package:flutter_metronome/service/services/api/jinghong_api.dart';
import 'package:flutter_metronome/service/services/sql_lite/sql_lite.dart';
import 'package:intl/intl.dart';

Future<bool> dataTransmit() async {
  final payDbClient = PayDbClient.instance;
  final payApiClient = PayApiClient.instance;
  final playerConfigApiClient = PlayerConfigApiClient();
  final playerConfigDbClient = PlayerConfigDbClient();

  final paymentRecord = await payDbClient.getAllPaymentList();
  if (paymentRecord.isNotEmpty) {
    await payApiClient.insertPayments(paymentRecord);
    payDbClient.truncatePaymentRecord();
  }

  final playerConfigs = await playerConfigDbClient.getAllPlayerConfigs();
  if (playerConfigs.isNotEmpty) {
    await playerConfigApiClient.insertPlayerConfigs(playerConfigs);
    playerConfigDbClient.truncatePlayerConfigs();
  }

  return true;
}

Future<bool> handleUpdateTransaction(
  dynamic arguments,
  PayService payService,
) async {
  final rst = arguments;
  List<int> decodedBytes = base64Decode(rst);
  String jsonStr = utf8.decode(decodedBytes);
  Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
  final transactionInfo = TransactionInfo.fromJson(jsonMap);

  final CreatePaymentRecordResponse payRes;
  try {
    // 1. 创建购买单据
    payRes = await payService.createPayment(
      CreatePaymentRecordRequest(
        accountToken: transactionInfo.appAccountToken,
        createTime: DateFormat('yyyy-MM-dd HH:mm:ss').format(
          DateTime.fromMillisecondsSinceEpoch(transactionInfo.purchaseDate),
        ),
        productName: "123",
        quantity: transactionInfo.quantity,
        price: transactionInfo.price / 1000,
        amount: (transactionInfo.quantity * transactionInfo.price) / 1000,
      ),
    );
  } on Exception catch (_) {
    return false;
  }

  // 2. 更新订单信息
  try {
    payService.updatePayment(
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
    await payService.updatePayment(
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
