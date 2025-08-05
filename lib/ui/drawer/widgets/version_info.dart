import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/utils/center_info.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

  final _info = '''
🥁简约无广告节拍器！

---
- 本节拍器主要有4个参数:**音符、BPM、节奏型、细分节奏**；参数都可以点击显示面板进行调整。
- 音符为节拍的参考音符，默认为4分音符
- BPM默认值为60，可调节范围为**[30,180]**；因为作者最快只能到150😄
- 节奏型：左边为每一小节的拍数，右边为每一拍的基准音符
- 细分音符：方便练不同节奏使用。这个是作者编写应用的初衷，因为市面上已有app能选细分节奏的，都要开会员
---

作者乐理知识有限，目前只能有这些功能； 欢迎大家帮忙勘误和提要求。 联系方式在《关于惊鸿》中🙏
''';

  @override
  Widget build(BuildContext context) {
    return CenterInfo(title: '版本说明', child: _buildChild(context));
  }

  Widget _buildChild(BuildContext context) {
    return GptMarkdown(_info);
  }
}
