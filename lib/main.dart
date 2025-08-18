import 'package:flutter/material.dart';
import 'package:flutter_metronome/dependency/initiate_app.dart';
import 'package:flutter_metronome/repo/agreement_repo.dart';
import 'package:flutter_metronome/route/router.dart';
import 'package:flutter_metronome/dependency/provider.dart';
import 'package:flutter_metronome/theme/theme.dart';
import 'package:flutter_metronome/theme/util.dart';
import 'package:provider/provider.dart';

void main() async {
  // 保障flutter相关信息初始化完成
  WidgetsFlutterBinding.ensureInitialized();
  await beforeAppInitial();
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {


  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
   
  }

    @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    final brightness = View.of(context).platformDispatcher.platformBrightness;
    // 采用googlefont，所用的字体下载到本地
    TextTheme textTheme = createTextTheme(
      context,
      "Noto Sans SC",
      "Noto Sans SC",
    );

    MaterialTheme theme = MaterialTheme(textTheme);

    return MaterialApp.router(
      title: '惊鸿节拍器',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      routerConfig: router(context.watch<AgreementRepo>()),
    );
  }
}

/* 

*/
