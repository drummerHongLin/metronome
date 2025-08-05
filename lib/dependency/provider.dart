import 'package:flutter_metronome/configs/data_type.dart';
import 'package:flutter_metronome/configs/default.dart';
import 'package:flutter_metronome/repo/pay_repo.dart';
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
    Provider(
      create:
          (ctx) => PayRepo(
            payService: ctx.read<PayDbClient>(),
            preferencesService: ctx.read(),
            thirdPayService: ctx.read<NativeChannel>(),
          ),
    ),
    Provider(
      create: (ctx) => SponsorshipViewModel(payRepo: ctx.read<PayRepo>()),
    ),
    Provider(
      create:
          (ctx) => MainScreenViewModel(
            bpm: DefaultData.bpm,
            beatNum: DefaultData.beatNum,
            beatNote: DefaultData.beatNote,
            referenceBeat: DefaultData.referenceBeat,
            beatTypes: [BeatType.A, BeatType.A, BeatType.A, BeatType.A],
          ),
    ),
  ];
}
