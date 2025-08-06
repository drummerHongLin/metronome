import 'package:flutter_metronome/repo/pay_repo.dart';
import 'package:flutter_metronome/repo/player_config_repo.dart';
import 'package:flutter_metronome/service/native_channel/native_channel.dart';

import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/service/sql_lite/sql_lite.dart';
import 'package:flutter_metronome/ui/drawer/view_models/sponsorship_view_model.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers {
  return [
    ChangeNotifierProvider(create: (context) => SharedPreferencesService()),
    Provider(create: (ctx) => PayDbClient()),
    Provider(create: (ctx) => NativeChannel.instance),
    Provider(create: (ctx)=> PlayerConfigDbClient()),
    Provider(
      create: (ctx) => PayRepo(
        payService: ctx.read<PayDbClient>(),
        preferencesService: ctx.read(),
        thirdPayService: ctx.read<NativeChannel>(),
      ),
    ),    Provider(create: (ctx)=>PlayerConfigRepo(playerConfigService: ctx.read<PlayerConfigDbClient>())),
    Provider(
      create: (ctx) => SponsorshipViewModel(payRepo: ctx.read<PayRepo>()),
    ),

    ChangeNotifierProvider(create: (ctx) => MainScreenViewModel(configRepo: ctx.read<PlayerConfigRepo>())),
  ];
}
