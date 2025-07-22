import 'package:flutter/material.dart';
import 'package:flutter_metronome/theme/theme.dart';
import 'package:flutter_metronome/theme/util.dart';
import 'package:flutter_metronome/ui/main_screen.dart';

void main() {
  runApp(const MyApp());
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

    return MaterialApp(
      title: '惊鸿节拍器',
      theme: brightness == Brightness.light ? theme.light() : theme.dark(),
      home: SafeArea(
        child: Scaffold(body: MainScreen(), resizeToAvoidBottomInset: false),
      ),
    );
  }
}
