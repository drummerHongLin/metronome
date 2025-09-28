import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/services/api/jinghong_api.dart';
import 'package:flutter_metronome/service/services/sql_lite/sql_lite.dart';

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
  // 暂时不用更新交易信息

  /*
    final rst = arguments;
  List<int> decodedBytes = base64Decode(rst);
  String jsonStr = utf8.decode(decodedBytes);
  if(jsonStr == 'false' ) return true;
  Map<String, dynamic> jsonMap = jsonDecode(jsonStr);
  final transactionInfo = TransactionInfo.fromJson(jsonMap);
  PaymentRecord? existingRecord;
 
  try{
    existingRecord = await payService.getPaymentByTransactionId(transactionInfo.transactionId);
  }
  on Exception {
    existingRecord = null;
  }

 


if(existingRecord != null ){

  // 2. 更新订单信息
  try {
    payService.updatePayment(
      UpdatePaymentRecordRequest(
        paymentNo: existingRecord.paymentNo,
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
        paymentNo: paymentNo,
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
}
*/
  return true;
}
