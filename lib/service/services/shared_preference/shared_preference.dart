import 'dart:convert';
import 'package:flutter_metronome/service/model/token/token_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

// 持久化存储用户是否同意用户协议

class SharedPreferencesService {
  static const _agreeKey = 'is_agreed';
  static const _accountTokenKey = 'account_token';
  static const _loginTokenKey = 'login_token';

  SharedPreferencesService._();
  static final _instance = SharedPreferencesService._();
  static SharedPreferencesService get instance => _instance;

  String? _accounToken;
  TokenInfo? loginToken;


  bool get isLoggedIn {
    if (loginToken == null) return false;
    if (loginToken!.expiredAt >
        DateTime.now().millisecondsSinceEpoch ~/ 1000) {
      return true;
    } else {
      loginToken = null;
      saveLoginToken(null);
      return false;
    }
  }

  Future<String> get accountToken async {
    if (_accounToken == null) await createAccountToken();
    return _accounToken!;
  }

  Future<bool> fetchAgreeStatus() async {
    final sp = await SharedPreferences.getInstance();
    final agreeStr = sp.getString(_agreeKey);
    if (agreeStr == null) {
      return false;
    }
    return jsonDecode(agreeStr);
  }

  Future<void> saveAgreeStatus(bool? isAgreed) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if (isAgreed == null) {
      await sharedPreferences.remove(_agreeKey);
    } else {
      await sharedPreferences.setString(_agreeKey, jsonEncode(isAgreed));
    }
  }

  Future<void> createAccountToken() async {
    final uuid = Uuid();
    final token = uuid.v4();
    _accounToken = await saveAccountToken(token);
    return;
  }

  Future<String> saveAccountToken(String accountToken) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedToken = sharedPreferences.getString(_accountTokenKey);
    if (savedToken != null) return savedToken;
    await sharedPreferences.setString(_accountTokenKey, accountToken);
    return accountToken;
  }

  Future<TokenInfo?> fetchLoginToken() async {
    final sp = await SharedPreferences.getInstance();
    final tokenString = sp.getString(_loginTokenKey);
    if (tokenString == null) return null;
    loginToken = TokenInfo.fromJson(jsonDecode(tokenString));
    return loginToken;
  }

  Future<void> saveLoginToken(TokenInfo? token) async {
    loginToken = token;
    final sharedPreferences = await SharedPreferences.getInstance();
    if (token == null) {
      await sharedPreferences.remove(_loginTokenKey);
    } else {
      await sharedPreferences.setString(
        _loginTokenKey,
        jsonEncode(token.toJson()),
      );
    }
  }
}
