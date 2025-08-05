import 'package:flutter/material.dart';
import 'package:flutter_metronome/ui/utils/center_info.dart';
import 'package:gpt_markdown/gpt_markdown.dart';

class JinghongInfo extends StatelessWidget {
  const JinghongInfo({super.key});

  final _info = '''
👉🏻关于**「惊鸿节拍器」**的诞生故事：
鼓手星子（工程师小鸿的鼓手马甲）的个人练习工具

✨真实使用感拉满：
▪️纯纯无广告骚扰（后续也不会插广告！）
▪️细分节拍精准适配架子鼓练习
▪️目前只计划加个开屏广告页维持运营
​
⚠️独立开发者的艰辛历程：
该产品是作者从设计到开发到部署独立完成
目前还存在界面不美观，功能较少的问题
有新想法或者发现bug的宝子可以：
▫️评论区直接留言
▫️私信 / 邮箱联系小鸿 (honghouse@sina.cn)

🙋🏻急寻**产品设计搭子**一起搞事：
✔️改进现有产品体验
✔️一起开发后续机器人相关项目

💸卑微求赞助环节：
收入真的很微薄（开屏广告能有多少啊喂），全靠爱发电维持开发！🪫
如果觉得好用的宝子，拜托多多支持一下～让独立开发的诚意产品能走得更远🙏
''';

  @override
  Widget build(BuildContext context) {
    return CenterInfo(title: '关于惊鸿', child: _buildChild());
  }

  Widget _buildChild() {
    return GptMarkdown(_info);
  }
}
