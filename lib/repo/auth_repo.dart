import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_metronome/repo/model/user.dart';
import 'package:flutter_metronome/service/interface/user.dart';
import 'package:flutter_metronome/service/model/user/user_data.dart';
import 'package:flutter_metronome/service/shared_preference/model/token_data.dart';
import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/utils/result.dart';
import 'package:image_picker/image_picker.dart';

class AuthRepo extends ChangeNotifier{
  final SharedPreferencesService _preferencesService;
  final UserService _userClient;

  AuthRepo({
    required SharedPreferencesService preferencesService,
    required UserService userService,
  }) : _userClient = userService,
       _preferencesService = preferencesService;

  TokenInfo? _token;

  Future<bool> get isLoggedIn async {
    if(_token != null) return true;
    _token = await _preferencesService.fetchLoginToken();
    if(_token != null) return true;
    return false;
  }


  Future<Result<void>> changePassword(
    String newPassword,
    String username,
    String code,
  ) async {
    try {
      final rst = await _userClient.verifyEmail(
        username,
        EmailVerifingRequest(code: code),
      );
      await _userClient.changePassword(
        ChangePasswordRequest(newPassword: newPassword),
        username,
        rst.token,
      );
      _token = TokenInfo(value: rst.token, expiredAt: rst.expiredAt);
      _preferencesService.saveLoginToken(_token);

      return Success(null);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final data = e.response?.data;
        return Failure("修改密码失败:${data['message']}", e);
      }
      return Failure("修改密码失败!", e);
    } on Exception catch (e) {
      return Failure("修改密码失败!", e);
    }
  }

  
  Future<Result<void>> login(String username, String password) async {
    try {
      final rst1 = await _userClient.login(
        LoginRequest(username: username, password: password),
      );
      _token = TokenInfo(value: rst1.token, expiredAt: rst1.expiredAt);
      _preferencesService.saveLoginToken(_token);
      _userClient.token =rst1.token;
     
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final data = e.response?.data;
        return Failure("登录失败:${data['message']}", e);
      }
      return Failure("登录失败!", e);
    } on Exception catch (e) {
      return Failure("登录失败!", e);
    }
  }

  
  Future<Result<void>> register(String username, String code) async {
    try {
      final rst1 = await _userClient.verifyEmail(
        username,
        EmailVerifingRequest(code: code),
      );
      _token = TokenInfo(value: rst1.token, expiredAt: rst1.expiredAt);
      _preferencesService.saveLoginToken(_token);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final data = e.response?.data;
        return Failure("注册失败:${data['message']}", e);
      }
      return Failure("注册失败!", e);
    } on Exception catch (e) {
      return Failure("注册失败!", e);
    }
  }

  
  Future<Result<void>> sendVerificationEmail(
    String username,
    String password,
    String nickname,
    String email,
  ) async {
    try {
      // 先注册用户信息
      await _userClient.register(
        RegisterRequest(
          username: username,
          password: password,
          nickname: nickname,
          email: email,
        ),
      );
      // 注册成功后，发送邮件
      await _userClient.sendEmail(username);
      return Success(null);
    } on DioException catch (e) {
      return Failure("网络错误：", e);
    } on Exception catch (e) {
      return Failure("服务错误：", e);
    }
  }



  
  Future<Result<UserInfo>> getUserInfo() async {
    try {
      if(! await isLoggedIn) return Failure("未登录");
      // 如果是已登录状态，那么token一定是有的
      final rst = await _userClient.getUser(_token!.value);
      final u = UserInfo(
        username: rst.username,
        password: rst.password,
        nickname: rst.nickname,
        avatarUrl: rst.avatarUrl,
        email: rst.email,
        token: _token!.value,
      );
      return Success(u);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // 如果是认证信息失败，那么清空本地的token留存
        logout();
      }
      return Failure("网络错误：", e);
    } on Exception catch (e) {
      // 其他能不错误
      return Failure("服务错误：", e);
    }
  }

  
  Result<void> logout() {
    try {
      _token = null;
      _preferencesService.saveLoginToken(null);
      _userClient.token = null;
      return Success(null);
    } on Exception catch (_) {
      return Failure("登出失败");
    }
  }

  
  Future<Result<void>> sendChangePasswordEmail(String username) async {
    try {
      // 先确定用户是否已经验证过了
      final rst = await _userClient.verifyUser(username);

      if (!rst) {
        return Failure("用户未认证");
      }

      await _userClient.sendEmail(username);
      return Success(null);
    } on DioException catch (e) {
      return Failure("${e.response?.data["message"]}", e);
    } on Exception catch (e) {
      return Failure("邮件发送失败!", e);
    }
  }

  
  Future<Result<void>> setAvatar(String username, XFile file) async {
    try {
      
      if(! await isLoggedIn) return Failure("未登录");

      await _userClient.setAvatar(username, _token!.value, file);
      return Success(null);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        // 如果是认证信息失败，那么清空本地的token留存
        logout();
      }
      return Failure("网络错误：", e);
    } on Exception catch (e) {
      // 其他能不错误
      return Failure("服务错误：", e);
    }
  }

  
  Future<Result<void>> changePasswordOnLogin(
    String newPassword,
    String username,
  ) async {
    try {
      if(! await isLoggedIn) return Failure("未登录");
      await _userClient.changePassword(
        ChangePasswordRequest(newPassword: newPassword),
        username,
        _token!.value,
      );

      return Success(null);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        final data = e.response?.data;
        return Failure("修改密码失败:${data['message']}", e);
      }
      return Failure("修改密码失败!", e);
    } on Exception catch (e) {
      return Failure("修改密码失败!", e);
    }
  }

  
}
