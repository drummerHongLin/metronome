import 'package:flutter/material.dart';

class ButtoneSector extends StatelessWidget {

  final VoidCallback onPlayPressed;
  final VoidCallback onResetPressed;

  final bool playing;

  const ButtoneSector({super.key, required this.onPlayPressed, required this.onResetPressed, required this.playing});


  @override
  Widget build(BuildContext context) {
            return   SizedBox(
              height: 100,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: onPlayPressed,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          playing ? "暂停" : "开始",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: onResetPressed,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "重置",
                          style: Theme.of(context).textTheme.displaySmall,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
       
  }

  

}