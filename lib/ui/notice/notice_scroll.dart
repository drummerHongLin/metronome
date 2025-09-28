import 'dart:async';

import 'package:flutter/material.dart';

class NoticeScroll extends StatefulWidget{
  const NoticeScroll({super.key});

  @override
  State<NoticeScroll> createState() => _NoticeScrollState();
}

class _NoticeScrollState extends State<NoticeScroll> with SingleTickerProviderStateMixin {

  late final AnimationController controller;
  late Timer timer;
  int showIndex = 1;  
  final msg = [
    "使用系统扬声器,请关闭静音模式",
    "其他播放打断后,请暂停后重新开始"
  ];

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this,duration: Duration(seconds: 1),value: 1);
    timer = Timer.periodic(Duration(seconds: 10), (_){
      setState(() {
        showIndex++;
        controller.reset();
        controller.forward();
      });
    });
  }

  @override
  void dispose() {
    timer.cancel();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 300,
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          _buildAnimation(false, showIndex%2),
          _buildAnimation(true, (showIndex+1)%2)
        ],
      ),
    );
  }
  Widget _buildAnimation(bool i,int index){
    return AnimatedBuilder(animation: controller, builder:(context, child) => 
    Transform.translate(offset: Offset(0, 20 * (i?(1-controller.value):controller.value )),child: 
    Opacity(opacity: i? controller.value : (1-controller.value),child: 
    Text(msg[index],style: Theme.of(context).textTheme.titleSmall,),)
    ,) 
    );
  }
}


