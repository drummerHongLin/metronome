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
    BaseOptions(baseUrl: "https://www.honghouse.cn/api/",
    connectTimeout: Duration(seconds: 5),
    sendTimeout: Duration(seconds: 3),
    receiveTimeout: Duration(seconds: 3)),
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
  // 关于全局参数性质，采用单例模式
  UserApiClient._();

  static final _instance = UserApiClient._();

  static UserApiClient get instance => _instance;

  @override
  set token(String? token) {
    setToken(token);
  }

  // 设置登录功能 -- 沿用jinghongv4
  // 含登录，注册，验证功能
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    final client = getClient();
    final response = await client.post(
      "/login",
      data: jsonEncode(loginRequest),
    );
    return LoginResponse.fromJson(response.data);
  }

  @override
  Future<void> register(RegisterRequest request) async {
    final client = getClient();
    await client.post("/v1/users/register", data: jsonEncode(request));
  }

  @override
  Future<GetUserResponse> getUser() async {
    final client = getClient();
    final res = await client.get("/v1/users/current-user");
    return GetUserResponse.fromJson(res.data);
  }

  @override
  Future<bool> verifyUser(String username) async {
    final client = getClient();
    final rst = await client.get("/v1/users/$username/verify");
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
    final client = getClient();

    await client.put(
      "/v1/users/$username/change-password",
      data: jsonEncode(request),
    );
  }

  @override
  Future<void> sendEmail(String username) async {
    final client = getClient();

    await client.get("/v1/users/$username/send-email");
  }

  @override
  Future<EmailVerifiedResponse> verifyEmail(
    String username,
    EmailVerifingRequest request,
  ) async {
    final client = getClient();

    final res = await client.post(
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
    final client = getClient();

    await client.post("/v1/users/$username/set-avatar", data: formData);
  }
}

class PayApiClient extends PayService with _DioClient {
  static final _instance = PayApiClient._();

  static PayApiClient get instance => _instance;

  PayApiClient._();
  // 存储支付记录功能

  @override
  Future<CreatePaymentRecordResponse> createPayment(
    CreatePaymentRecordRequest request,
  ) async {
    final client = getClient();
    // 需要本地生成paymentNo
    final paymentNo = "FK${DateTime.now().millisecondsSinceEpoch}";
    // 将请求转化成json
    final paymentInfoJson = request.toJson();
    paymentInfoJson['paymentNo'] = paymentNo;
    client.post('/v1/payment', data: paymentInfoJson);
    return CreatePaymentRecordResponse(paymentNo: paymentNo);
  }

  @override
  Future<void> updatePayment(UpdatePaymentRecordRequest request) async {
    final client = getClient();
    // 如果状态码不是200， 那么Dio会报错，错误处理放在repo中
    await client.put('/v1/payment', data: jsonEncode(request));
  }

  @override
  Future<GetPaymentListResponse> getPaymentList(
    GetPaymentListRequest request,
  ) async {
    final client = getClient();
    final rst = await client.post(
      '/v1/payment/get-payments/${request.start}/${request.end}',
    );
    return GetPaymentListResponse.fromJson(rst.data);
  }

  Future<void> insertPayments(List<PaymentRecord> prs) async {
    final client = getClient();
    await client.post("/v1/payment/insert-payments", data: jsonEncode(prs));
  }
}

class PlayerConfigApiClient extends PlayerConfigService with _DioClient {
  PlayerConfigApiClient();

  @override
  Future<void> createPlayerConfig(PlayerConfig p) async {
    final client = getClient();

    await client.post("/v1/player", data: jsonEncode(p));
  }

  @override
  Future<void> deletePlayerConfig(String pNo) async {
    final client = getClient();

    await client.delete("/v1/player/$pNo");
  }

  @override
  Future<GetPlayerConfigsResponse> getPlayerConfigs(
    int offset,
    int limit,
  ) async {
    final client = getClient();

    final rst = await client.get(
      "/v1/player/get-play-configs/$offset/$limit",
    );
    return GetPlayerConfigsResponse.fromJson(rst.data);
  }

  @override
  Future<void> updatePlayerConfig(PlayerConfig p) async {
    final client = getClient();

    await client.put("/v1/player", data: jsonEncode(p));
  }

  Future<void> insertPlayerConfigs(List<PlayerConfig> p) async {
    final client = getClient();

    await client.post(
      "/v1/player/insert-play-configs",
      data: jsonEncode(p),
    );
  }
}
