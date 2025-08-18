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
import 'package:flutter_metronome/ui/auth/auth_viewmodel.dart';
import 'package:flutter_metronome/ui/drawer/view_models/sponsorship_view_model.dart';
import 'package:flutter_metronome/ui/drawer/view_models/user_view_model.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    // 不依赖任何状态的服务
    Provider<SharedPreferencesService>.value(value: SharedPreferencesService.instance),
    Provider<ThirdPayService>.value(value: ThirdPayNCService.instance),
    Provider<UserService>.value(value: UserApiClient.instance),
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
          return PayApiClient.instance;
        } else {
          return PayDbClient.instance;
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
    ProxyProvider<PayService, PayRepo>(
      update: (ctx, ps, pr) => PayRepo(
        payService: ps,
        preferencesService: ctx.read(),
        thirdPayService: ctx.read<ThirdPayService>(),
      ),
    ),
    ProxyProvider<PlayerConfigService, PlayerConfigRepo>(
      update: (ctx, pcs, pcr) => PlayerConfigRepo(playerConfigService: pcs),
    ),
    ProxyProvider<PayRepo, SponsorshipViewModel>(
      update: (ctx, pr, sv) => SponsorshipViewModel(payRepo: pr),
    ),

    ChangeNotifierProxyProvider<PlayerConfigRepo, MainScreenViewModel>(
      create: (ctx) => MainScreenViewModel(configRepo: ctx.read()),
      update: (ctx, pcr, msv) {
        if (msv != null) return msv.updatePlayerConfig(pcr);
        return MainScreenViewModel(configRepo: pcr);
      },
    ),
    Provider(create: (ctx) => UserViewModel(authRepo: ctx.read())),
    Provider(create: (ctx) => AuthViewmodel(authRepo: ctx.read())),
  ];
}
