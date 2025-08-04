import 'package:flutter_metronome/service/model/pay/pay_data.dart';

abstract class PayService {

  Future<CreatePaymentRecordResponse> createPayment(CreatePaymentRecordRequest request );
  Future<void> updatePayment(UpdatePaymentRecordRequest request) ;
  Future<GetPaymentListResponse> getPaymentList(GetPaymentListRequest request) ;

}