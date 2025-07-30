import 'package:flutter/material.dart';
import 'package:flutter_metronome/route/router.dart';
import 'package:flutter_metronome/dependency/provider.dart';
import 'package:flutter_metronome/theme/theme.dart';
import 'package:flutter_metronome/theme/util.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: providers, child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routerConfig: router(context.read()),
    );
  }
}

/* 

*/
