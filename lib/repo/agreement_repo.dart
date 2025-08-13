import 'package:flutter/material.dart';
import 'package:flutter_metronome/service/services/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/utils/result.dart';

class AgreementRepo extends ChangeNotifier {
  AgreementRepo({required SharedPreferencesService preferencesService})
    : _preferencesService = preferencesService;

  final SharedPreferencesService _preferencesService;

  bool _isAgreed = false;
  Future<bool> get isAgreed async {
    if (!_isAgreed) {
      _isAgreed = await _preferencesService.fetchAgreeStatus();
    }
    return _isAgreed;
  }

  Future<Result<void>> saveAgreeStatus(bool isAgreed) async {
    _isAgreed = isAgreed;
    try {
      await _preferencesService.saveAgreeStatus(isAgreed);
    } on Exception {
      return Failure("更新状态失败!");
    } finally {
      notifyListeners();
    }
    return Success(null);
  }
}
