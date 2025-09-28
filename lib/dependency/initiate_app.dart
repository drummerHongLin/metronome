import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_metronome/service/services/api/jinghong_api.dart';
import 'package:flutter_metronome/service/services/native_channel/native_channel.dart';
import 'package:flutter_metronome/service/services/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/service/services/sql_lite/sql_lite.dart';
import 'package:flutter_metronome/utils/tools.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

Future<void> beforeAppInitial() async {
  // 先获取登录状态
  final preferencesService = SharedPreferencesService.instance;
  final thirdPayNCService = ThirdPayNCService.instance;

  // 网络情况
  final List<ConnectivityResult> connectivityResult = await (Connectivity()
      .checkConnectivity());
  bool canReach = true;
  if (connectivityResult.contains(ConnectivityResult.mobile) ||
      connectivityResult.contains(ConnectivityResult.wifi)) {
    // 有网络的情况下设置 检查远端服务是否可用
    final client = Dio(
      BaseOptions(
        baseUrl: "https://www.honghouse.cn/api",
        connectTimeout: Duration(seconds: 5),
        sendTimeout: Duration(seconds: 3),
        receiveTimeout: Duration(seconds: 3),
      ),
    );
    try {
      await client.post("",data: {});
    } on DioException catch (e) {
      if ([
        DioExceptionType.connectionTimeout,
        DioExceptionType.sendTimeout,
        DioExceptionType.receiveTimeout,
      ].contains(e.type)) {
        canReach = false;
      }
    }
  } else {
    canReach = false;
  }

  if (canReach) {
    // 获取token信息
    await preferencesService.fetchLoginToken();
    // 获取完后，判断
    // 如果是已登录状态 配置userClient
    // 后续不用更新，因为只会在重新开启程序时有用
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

  // 初始化声音播放器

  await SoLoud.instance.init(
    sampleRate: 44100,      // Audio quality
    bufferSize: 2048,       // Buffer size affects latency
    channels: Channels.stereo, // 单声道
  );



 
}
