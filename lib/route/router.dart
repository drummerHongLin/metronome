import 'package:flutter/material.dart'
    show Widget, BuildContext, SafeArea, Scaffold;
import 'package:flutter_metronome/ui/main_screen.dart';
import 'package:flutter_metronome/ui/policy/interaction_card.dart';

Map<String, Widget Function(BuildContext)> router() => {
  '/user_agreement': (ctx) => InteractionCard(),
  '/':
      (ctx) => SafeArea(
        child:  MainScreen(),
      ),
};
