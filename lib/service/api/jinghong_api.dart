import 'dart:convert';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/user.dart';
import 'package:flutter_metronome/service/model/pay/pay_data.dart';
import 'package:flutter_metronome/service/model/user/user_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';

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

  UserApiClient({String? baseUrl}) {
    if (baseUrl != null) setUrl(baseUrl);
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
  Future<GetUserResponse> getUser(String token) async {
    final res = await _client.get(
      "/v1/users/current-user",
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
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
    String token,
  ) async {
    await _client.put(
      "/v1/users/$username/change-password",
      data: jsonEncode(request),
      options: Options(headers: {'Authorization': 'Bearer $token'}),
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
  Future<void> setAvatar(String username, String token, XFile file) async {
    final f = await file.readAsBytes();
    final formData = FormData.fromMap({
      'file': MultipartFile.fromBytes(f, filename: file.name),
    });

    await _client.post(
      "/v1/users/$username/set-avatar",
      data: formData,
      options: Options(headers: {'Authorization': 'Bearer $token'}),
    );
  }
}

class PayApiClient extends PayService with _DioClient {
  late final Dio _client;

  PayApiClient({String? baseUrl}) {
    if (baseUrl != null) setUrl(baseUrl);
    _client = getClient();
  }

  // 存储支付记录功能

  @override
  Future<CreatePaymentRecordResponse> createPayment(
    CreatePaymentRecordRequest request,
  ) async {
    final rst = await _client.post(
      'v1/payment/create-payment',
      data: jsonEncode(request),
    );
    return CreatePaymentRecordResponse.fromJson(rst.data);
  }

  @override
  Future<void> updatePayment(UpdatePaymentRecordRequest request) async {
    // 如果状态码不是200， 那么Dio会报错，错误处理放在repo中
    await _client.post('v1/payment/create-payment', data: jsonEncode(request));
  }

  @override
  Future<GetPaymentListResponse> getPaymentList(
    GetPaymentListRequest request,
  ) async {
    final rst = await _client.post(
      'v1/payment/get-payment',
      data: jsonEncode(request),
    );

    return GetPaymentListResponse.fromJson(rst.data);
  }
}
