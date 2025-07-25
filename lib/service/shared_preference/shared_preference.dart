import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 持久化存储用户是否同意用户协议

 class SharedPreferencesService extends ChangeNotifier {
  static const _agreeKey = 'is_agreed';

  bool _isAgreed = false;

  Future<bool> get isAgreed async {
    if(!_isAgreed){
      _isAgreed = await fetchAgreeStatus();
    }
    return _isAgreed;
  } 

   Future<bool> fetchAgreeStatus() async {
    final sp = await SharedPreferences.getInstance();
    final tokenString = sp.getString(_agreeKey);
    if (tokenString == null) {
      return false;
    }
    return jsonDecode(tokenString);
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
}
