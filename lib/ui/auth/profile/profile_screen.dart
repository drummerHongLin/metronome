import 'package:flutter/material.dart';
import 'package:flutter_metronome/repo/model/user.dart';
import 'package:flutter_metronome/route/routes.dart';
import 'package:flutter_metronome/ui/auth/auth_viewmodel.dart';
import 'package:flutter_metronome/ui/utils/circle_img.dart';
import 'package:flutter_metronome/utils/result.dart';
import 'package:go_router/go_router.dart';


class ProfileScreen extends StatefulWidget {
  final AuthViewmodel viewmodel;

  const ProfileScreen({super.key, required this.viewmodel});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.loadUserInfo.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width*0.8),
        child: Card(
          color:  Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: ListenableBuilder(
              listenable: widget.viewmodel.loadUserInfo,
              builder: (context, c) {
                if (widget.viewmodel.loadUserInfo.running) {
                  return  SizedBox(
                      height: 100,
                      width: 100,
                      child: CircularProgressIndicator(),
                    
                  );
                } else if (widget.viewmodel.loadUserInfo.error) {
                  return  SizedBox(
                      height: 100,
                      width: 100,
                      child: Text(
                        (widget.viewmodel.loadUserInfo.result as Failure)
                            .message,
                      ),
                  
                  );
                } else {
                  return _success(
                    (widget.viewmodel.loadUserInfo.result as Success<UserInfo>)
                        .data,
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _success(UserInfo userInfo) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      spacing: 10,
      children: [
        CircleNetImg(
          imgUrl:
              'https://www.honghouse.cn/api/v1/users/${userInfo.username}/get-avatar',
          imgSize: Size(200, 200),
          headers: <String, String>{
            "Authorization": "Bearer ${userInfo.token}",
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
              onPressed: () async {
                final r = await context.push(Routes.setAvatar);
                if (r == true) {
                  widget.viewmodel.loadUserInfo.execute();
                }
              },
              child: Text("更改头像"),
            ),
            TextButton(onPressed: () {
              context.push(Routes.changePassword);
            }, child: Text("更改密码")),
          ],
        ),
      ],
    );
  }
}
