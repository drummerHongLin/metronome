import 'package:flutter/material.dart';
import 'package:flutter_metronome/route/routes.dart';
import 'package:flutter_metronome/ui/drawer/view_models/user_view_model.dart';
import 'package:flutter_metronome/ui/drawer/widgets/user_panel.dart';
import 'package:flutter_metronome/ui/utils/circle_img.dart';
import 'package:go_router/go_router.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.viewmodel});

  final UserViewModel viewmodel;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  final List<(String, String)> _tiles = [(Routes.version, '版本说明'), (Routes.about, '关于惊鸿'), (Routes.sponsorship, '赞助')];

  int _selectedIndex = 0;

  void _setSelectedIndex(int v) {
    setState(() {
      _selectedIndex = v;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 2,
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: CircleImg(
              imgFilePath: "assets/images/avatar.png",
              imgSize: Size(100, 100),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _tiles.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(_tiles[index].$2),
                  selected: _selectedIndex == index,
                  onTap: () async {
                    _setSelectedIndex(index);
                    // Update the state of the app
                    await context.push(_tiles[index].$1);
                    // Then close the drawer
                  },
                );
              },
            ),
          ),
          ListenableBuilder(
            listenable: widget.viewmodel.loadUserInfo,
            builder: (ctx, child) {
              if (widget.viewmodel.loadUserInfo.running) {
                return SizedBox(height: 40, child: CircularProgressIndicator());
              }
              return child!;
            },
            child: ValueListenableBuilder(
              valueListenable: widget.viewmodel.userInfo,
              builder: (ctx, userInfo, c) {
                final avatarUrl = userInfo == null
                    ? 'https://ai-tang.oss-cn-shanghai.aliyuncs.com/jinghong/%E6%9C%AA%E7%99%BB%E5%BD%95.png'
                    : 'https://www.honghouse.cn/api/v1/users/${userInfo.username}/get-avatar';
                final nickName = userInfo?.nickname ?? '未登录';
                final operationIcon = userInfo == null
                    ? Icons.login_outlined
                    : Icons.logout_outlined;
                final operation = userInfo == null
                    ? () {
                        context
                            .push(Routes.login)
                            .then(
                              (_) => widget.viewmodel.loadUserInfo.execute(),
                            );
                      }
                    : widget.viewmodel.logout;

                final headers = userInfo == null
                    ? null
                    : <String, String>{
                        "Authorization": "Bearer ${userInfo.token}",
                      };

                profileWindow() {
                  context
                      .push(Routes.profile)
                      .then((_) => widget.viewmodel.loadUserInfo.execute());
                }

                return UserPanel(
                  avatarUrl: avatarUrl,
                  nickname: nickName,
                  operationIcon: operationIcon,
                  operation: operation,
                  headers: headers,
                  profileWindow: profileWindow,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
