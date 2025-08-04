import 'package:flutter_metronome/repo/pay_repo.dart';
import 'package:flutter_metronome/service/native_channel/native_channel.dart';

import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/service/sql_lite/sql_lite.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> get providers {
  return [
    ChangeNotifierProvider(create: (context) => SharedPreferencesService(),),
    Provider(create: (ctx)=>PayDbClient()),
    Provider(create: (ctx)=>NativeChannel.instance),
    Provider(create: (ctx)=>PayRepo(payService: ctx.read<PayDbClient>(), preferencesService: ctx.read(), thirdPayService: ctx.read<NativeChannel>()))
  ];
}