import 'package:flutter/material.dart';
import 'package:flutter_metronome/repo/auth_repo.dart';
import 'package:flutter_metronome/repo/model/user.dart';
import 'package:flutter_metronome/utils/command.dart';
import 'package:flutter_metronome/utils/result.dart';

class UserViewModel {
  final AuthRepo _authRepo;
  late Command0<void> loadUserInfo;
  ValueNotifier<UserInfo?> userInfo = ValueNotifier(null);
  UserViewModel({required AuthRepo authRepo}) : _authRepo = authRepo {
    loadUserInfo = Command0(_loadUserInfo)..execute();
  }

  Future<Result<void>> _loadUserInfo() async {
    final rst = await _authRepo.getUserInfo();
    rst.when(
      success: (data) {
        userInfo.value = data;
      },
      failure: (msg, e) {
        // 如果获取失败清空当前用户信息
        userInfo.value = null;
      },
    );
    return rst;
  }

  void logout() {
    _authRepo.logout();
    loadUserInfo.execute();
  }
}
