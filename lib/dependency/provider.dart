import 'package:flutter_metronome/repo/agreement_repo.dart';
import 'package:flutter_metronome/repo/auth_repo.dart';
import 'package:flutter_metronome/repo/pay_repo.dart';
import 'package:flutter_metronome/repo/player_config_repo.dart';
import 'package:flutter_metronome/service/interface/pay.dart';
import 'package:flutter_metronome/service/interface/player_config.dart';
import 'package:flutter_metronome/service/interface/third_pay.dart';
import 'package:flutter_metronome/service/interface/user.dart';
import 'package:flutter_metronome/service/services/api/jinghong_api.dart';
import 'package:flutter_metronome/service/services/native_channel/native_channel.dart';
import 'package:flutter_metronome/service/services/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/service/services/sql_lite/sql_lite.dart';
import 'package:flutter_metronome/ui/drawer/view_models/sponsorship_view_model.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    // 不依赖任何状态的服务
    Provider(create: (ctx) => SharedPreferencesService()),
    Provider(create: (ctx) => ThirdPayNCService()),
    Provider(create: (ctx) => UserApiClient()),
    // 应用前置状态
    ChangeNotifierProvider(
      create: (context) => AgreementRepo(preferencesService: context.read()),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthRepo(
        preferencesService: context.read<SharedPreferencesService>(),
        userService: context.read<UserService>(),
      ),
    ),
    // 依赖登录等状态的
    ProxyProvider<AuthRepo, PayService>(
      update: (ctx, auth, pay) {
        if (auth.isLoggedIn) {
          return PayApiClient();
        } else {
          return PayDbClient();
        }
      },
    ),
    ProxyProvider<AuthRepo, PlayerConfigService>(
      update: (ctx, auth, config) {
        if (auth.isLoggedIn) {
          return PlayerConfigApiClient();
        } else {
          return PlayerConfigDbClient();
        }
      },
    ),
    // 业务数据相关注入
    Provider(
      create: (ctx) => PayRepo(
        payService: ctx.watch<PayService>(),
        preferencesService: ctx.read(),
        thirdPayService: ctx.watch<ThirdPayService>(),
      ),
    ),
    Provider(
      create: (ctx) => PlayerConfigRepo(
        playerConfigService: ctx.watch<PlayerConfigService>(),
      ),
    ),
    Provider(
      create: (ctx) => SponsorshipViewModel(payRepo: ctx.watch<PayRepo>()),
    ),

    ChangeNotifierProvider(
      create: (ctx) =>
          MainScreenViewModel(configRepo: ctx.watch<PlayerConfigRepo>()),
    ),
  ];
}
