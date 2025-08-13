import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/player_config.dart';
import 'package:flutter_metronome/service/interface/user.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/model/player_config/player_config_data.dart';
import 'package:flutter_metronome/service/model/user/user_data.dart';
import 'package:image_picker/image_picker.dart';

mixin _DioClient {
  static final Dio client = Dio(
    BaseOptions(baseUrl: "https://www.honghouse.com/api/"),
  );

  void setToken(String? token) {
    if (token == null) {
      client.options.headers.remove('Authorization');
    } else {
      client.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  void setUrl(String url) {
    client.options.baseUrl = url;
  }

  Dio getClient() {
    return client;
  }
}

class UserApiClient extends UserService with _DioClient {
  late final Dio _client;

  UserApiClient() {
    _client = getClient();
  }

  @override
  set token(String? token) {
    setToken(token);
  }

  // 设置登录功能 -- 沿用jinghongv4
  // 含登录，注册，验证功能
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final response = await _client.post(
      "/login",
      data: jsonEncode(loginRequest),
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<void> register(RegisterRequest request) async {
    await _client.post("/v1/users/register", data: jsonEncode(request));
  }

  @override
  Future<GetUserResponse> getUser() async {
    final res = await _client.get("/v1/users/current-user");
    return GetUserResponse.fromJson(res.data);
  }

  @override
  Future<bool> verifyUser(String username) async {
    final rst = await _client.get("/v1/users/$username/verify");
    if (rst.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<void> changePassword(
    ChangePasswordRequest request,
    String username,
  ) async {
    await _client.put(
      "/v1/users/$username/change-password",
      data: jsonEncode(request),
    );
  }

  @override
  Future<void> sendEmail(String username) async {
    await _client.get("/v1/users/$username/send-email");
  }

  @override
  Future<EmailVerifiedResponse> verifyEmail(
    String username,
    EmailVerifingRequest request,
  ) async {
    final res = await _client.post(
      "/v1/users/$username/verify-email",
      data: jsonEncode(request),
    );
    return EmailVerifiedResponse.fromJson(res.data);
  }

  @override
  Future<void> setAvatar(String username, XFile file) async {
    final f = await file.readAsBytes();
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(f, filename: file.name),
    });

    await _client.post("/v1/users/$username/set-avatar", data: formData);
  }
}

class PayApiClient extends PayService with _DioClient {
  late final Dio _client;

  PayApiClient() {
    _client = getClient();
  }

  // 存储支付记录功能

  @override
  Future<CreatePaymentRecordResponse> createPayment(
    CreatePaymentRecordRequest request,
  ) async {
        // 需要本地生成paymentNo
    final paymentNo = "FK${DateTime.now().millisecondsSinceEpoch}";
    // 将请求转化成json
    final paymentInfoJson = request.toJson();
    paymentInfoJson['paymentNo'] = paymentNo;
    final rst = await _client.post('v1/payment', data: paymentInfoJson);
    return CreatePaymentRecordResponse.fromJson(rst.data);
  }

  @override
  Future<void> updatePayment(UpdatePaymentRecordRequest request) async {
    // 如果状态码不是200， 那么Dio会报错，错误处理放在repo中
    await _client.put('v1/payment', data: jsonEncode(request));
  }

  @override
  Future<GetPaymentListResponse> getPaymentList(
    GetPaymentListRequest request,
  ) async {
    final rst = await _client.post(
      'v1/payment/get-payments/${request.start}/${request.end}',
    );
    return GetPaymentListResponse.fromJson(rst.data);
  }

  Future<void> insertPayments(List<PaymentRecord> prs) async {
    await _client.post("v1/payment/insert-payments", data: jsonEncode(prs));
  }
}

class PlayerConfigApiClient extends PlayerConfigService with _DioClient {
  late final Dio _client;

  PlayerConfigApiClient() {
    _client = getClient();
  }

  @override
  Future<void> createPlayerConfig(PlayerConfig p) async {
    await _client.post("v1/player-config", data: jsonEncode(p));
  }

  @override
  Future<void> deletePlayerConfig(String pNo) async {
    await _client.delete("v1/player-config/$pNo");
  }

  @override
  Future<GetPlayerConfigsResponse> getPlayerConfigs(
    int offset,
    int limit,
  ) async {
    final rst = await _client.get(
      "v1/player-config/get-player-configs/$offset/$limit",
    );
    return GetPlayerConfigsResponse.fromJson(rst.data);
  }

  @override
  Future<void> updatePlayerConfig(PlayerConfig p) async {
    await _client.put("v1/player-config", data: jsonEncode(p));
  }

  Future<void> insertPlayerConfigs(List<PlayerConfig> p) async {
    await _client.post(
      "v1/player-config/insert-player-configs",
      data: jsonEncode(p),
    );
  }
}
