import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_metronome/service/shared_preference/model/token_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

// 持久化存储用户是否同意用户协议

 class SharedPreferencesService extends ChangeNotifier {
  static const _agreeKey = 'is_agreed';
  static const _accountTokenKey = 'account_token';
  static const _loginTokenKey = 'login_token';

  bool _isAgreed = false;

  String? _accounToken;

  Future<String> get  accountToken async { 
    if(_accounToken == null) await createAccountToken(); 
    return _accounToken!;
  }

  Future<bool> get isAgreed async {
    if(!_isAgreed){
      _isAgreed = await fetchAgreeStatus();
    }
    return _isAgreed;
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
      _isAgreed = isAgreed;
    }
    notifyListeners(); 
  }
  
  Future<void> createAccountToken() async{
    final uuid = Uuid();
    final token = uuid.v4();
    _accounToken = await saveAccountToken(token);
    return;
  }
  
  Future<String> saveAccountToken(String accountToken ) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final savedToken = sharedPreferences.getString(_accountTokenKey);
    if(savedToken != null) return savedToken;
    await sharedPreferences.setString(_accountTokenKey, accountToken);
    return accountToken;
  }


 Future<TokenInfo?> fetchLoginToken() async{
    final sp = await SharedPreferences.getInstance(); 
    final tokenString = sp.getString(_loginTokenKey);
    if(tokenString == null){
      return null;
    }
    return TokenInfo.fromJson(jsonDecode(tokenString)); 
  }

  Future<void> saveLoginToken(TokenInfo? token) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    if(token == null){
      await sharedPreferences.remove(_loginTokenKey);
    }
    else {
      await sharedPreferences.setString(_loginTokenKey,jsonEncode( token.toJson()));
    }
  }

} 
