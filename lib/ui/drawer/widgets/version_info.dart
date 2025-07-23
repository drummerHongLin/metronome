import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/drawer/widgets/tile_info.dart';

class VersionInfo extends StatelessWidget {
  const VersionInfo({super.key});

  final _info = '''🥁独立开发神仙节拍器！
😭​谁懂啊家人们！练鼓党终于有干净的节拍器了''';

  @override
  Widget build(BuildContext context) {
    return TileInfo(title: '版本说明', child: _buildChild());
  }

  Widget _buildChild() {
    return 
      Column(
        children: [
          Text(_info),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(text: TextSpan(
              children: [
                TextSpan(text: "1. 本节拍器主要有4个参数:"),
                TextSpan(text: " 音符 BPM 节奏型 细分节奏 ",style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "参数都可以点击显示面板进行调整。"),
              ],style: TextStyle(color: Colors.black)
            )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("2. 音符为节拍的参考音符，默认为4分音符。"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: 
            RichText(text: TextSpan(
              children:   [ TextSpan(text: "3. BPM默认值为60，可调节范围为"),
                TextSpan(text: " [30,180] ",style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "因为作者最快只能到150😄"),
                ],style: TextStyle(color: Colors.black)
            ))
           
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("4. 节奏型：左边为每一小节的拍数，右边为每一拍的基准音符。"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("5. 细分音符：方便练不同节奏使用。这个是作者编写应用的初衷，因为市面上已有app能选细分节奏的，都要开会员。"),
          ),
          Text('''作者乐理知识有限，目前只能有这些功能； 欢迎大家帮忙勘误和提要求。 联系方式在《关于惊鸿》中🙏'''),
        ],
      );
  }
}
