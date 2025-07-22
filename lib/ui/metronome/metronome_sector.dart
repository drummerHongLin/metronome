import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MetronomeBody extends StatelessWidget {
  final Animation<double> controller;
  final int beatNum;

  const MetronomeBody({super.key, required this.controller, required this.beatNum}) ;



  @override
  Widget build(BuildContext context) {

    return 
    Expanded(
      child: Column(
        children: [
       Expanded(
        child: Center(
          child: Lottie.asset(
            "assets/lottie/main_scene.json",
            controller: CurvedAnimation(parent: controller, curve: SawTooth((beatNum/2).ceil())),
          ),
        ),
      ),
     _DotNoteList(controller: controller,beatNum: beatNum,)
      ]),
    );
  }
}


class _DotNoteList extends AnimatedWidget {

  final Animation<double>  controller;
   final int beatNum;


  const _DotNoteList({ required this.controller,required this.beatNum}):super(listenable: controller);
  

  int get _activeIndex {
    if (controller.value ==0) return -1;
    final double progress = controller.value;
    return (progress * beatNum).floor() % beatNum;
  }


  @override
  Widget build(BuildContext context) {
    return 
     Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for(int i = 0; i< beatNum; i++)
           AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: i == _activeIndex ? Colors.black : Colors.transparent,
                shape: BoxShape.circle,
                border: Border.all()
              ),)
        ],
      );
  }
  
}