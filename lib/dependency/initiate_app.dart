import 'package:flutter_metronome/service/services/api/jinghong_api.dart';
import 'package:flutter_metronome/service/services/native_channel/native_channel.dart';
import 'package:flutter_metronome/service/services/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/service/services/sql_lite/sql_lite.dart';
import 'package:flutter_metronome/utils/tools.dart';

Future<void> beforeAppInitial() async {
  // 先获取登录状态
  final preferencesService = SharedPreferencesService.instance;
  final thirdPayNCService = ThirdPayNCService.instance;

  // 获取token信息
  await preferencesService.fetchLoginToken();
  // 获取完后，判断
  // 如果是已登录状态 配置userClient
  // 后续不用更新，因为只会在重新开启程序时有用
  if (preferencesService.isLoggedIn) {
    // 设置token信息
    UserApiClient.instance.token = preferencesService.loginToken?.value;
    thirdPayNCService.setUpChannel(
      (args) => handleUpdateTransaction(args, PayApiClient.instance),
    );
  } else {
    thirdPayNCService.setUpChannel(
      (args) => handleUpdateTransaction(args, PayDbClient.instance),
    );
  }
}
