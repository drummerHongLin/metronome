import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/ui/policy/widgts/external_web_view_screen.dart';

class InteractionCard extends StatelessWidget {
  const InteractionCard({super.key, required this.sps});
  final SharedPreferencesService sps;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: 
             Center(
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,

                      children: [
                        Text(
                          "惊鸿节拍器",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox.fromSize(size: Size(0, 5)),
                        Text(
                          "用户协议与隐私政策",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox.fromSize(size: Size(0, 20)),
                        Text(
                          "在您正式开始使用前，我们需要征得您对《隐私协议》与《用户协议》的同意。点击“同意”，即表示您已阅读并充分理解相关条款，我们将按照协议合法收集、使用并保护您的个人信息。若您暂不同意，请点击“不同意”，此时将无法继续提供本应用服务。",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ExternalWebViewScreen(
                                      url:
                                          'https://www.honghouse.cn/user-agreement.html', // 你的外部链接
                                      title: '用户协议',
                                    ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(5),
                          ),
                          child: Text("《用户协议》"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => ExternalWebViewScreen(
                                      url:
                                          'https://www.honghouse.cn/privacy-policy.html', // 你的外部链接
                                      title: '隐私政策',
                                    ),
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.all(5),
                          ),
                          child: Text("《隐私政策》"),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                SystemNavigator.pop();
                              },
                              child: Text("不同意"),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                sps.saveAgreeStatus(true);
                              },
                              child: Text('同意'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
