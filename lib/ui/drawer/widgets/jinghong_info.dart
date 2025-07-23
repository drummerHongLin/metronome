import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/drawer/widgets/tile_info.dart';

class JinghongInfo extends StatelessWidget {
  const JinghongInfo({super.key});

  final _info = '''
👉🏻关于「惊鸿节拍器」的诞生故事：​
开发者小鸿（鼓手星子）自己练架子鼓时被现有节拍器搞疯 —— 广告弹窗满天飞、细分节拍根本选不到！刚好在做应用开发项目，干脆自己上手撸了一个～​
✨真实使用感拉满：​
▪️纯纯无广告骚扰（后续也不会插广告！）​
▪️细分节拍精准适配架子鼓练习​
▪️目前只计划加个开屏广告页维持运营​
💡独立开发者的小声求助：​
因为是小鸿一个人从设计到敲代码全包圆👉🏻UI 审美和设计工具都在努力升级中！​
急寻产品设计搭子一起搞事📢：​
✔️改进现有产品体验​
✔️一起开发后续机器人相关项目（超酷！）​
⚠️关于小 bug：​
目前应用还有些小问题没调完，宝子们发现 bug 可以：​
▫️评论区直接留言​
▫️私信 / 邮箱联系小鸿​ (honghouse@sina.cn)
💸卑微求赞助环节：​
收入真的很微薄（开屏广告能有多少啊喂），全靠爱发电维持开发！如果觉得好用的宝子，拜托多多支持一下～让独立开发的诚意产品能走得更远🙏
''';

  @override
  Widget build(BuildContext context) {
    return TileInfo(title: '关于惊鸿', child: _buildChild());
  }

  Widget _buildChild() {
    return Text(_info);
  }
}
