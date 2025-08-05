import 'package:flutter/material.dart'
    show SafeArea, Curves, CurveTween, FadeTransition;
import 'package:flutter_metronome/service/shared_preference/shared_preference.dart';
import 'package:flutter_metronome/ui/main_screen.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:flutter_metronome/ui/policy/interaction_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(SharedPreferencesService sps) => GoRouter(
  initialLocation: '/user-agreement',
  refreshListenable: sps,
  routes: [
    GoRoute(
      path: '/user-agreement',
      builder: (context, state) => InteractionCard(sps: context.read()),
    ),
    GoRoute(
      path: '/',
      pageBuilder:
          (context, state) => CustomTransitionPage(
            transitionDuration: Duration(seconds: 1),
            reverseTransitionDuration: Duration(seconds: 1),
            child: SafeArea(child: MainScreen(viewModel: context.read<MainScreenViewModel>(),)),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) =>
                    FadeTransition(
                      opacity: CurveTween(
                        curve: Curves.easeInOutCirc,
                      ).animate(animation),
                      child: child,
                    ),
          ),
    ),
  ],
  redirect: (context, state) async {
    final agreed = await sps.isAgreed;
    final agreeing = state.matchedLocation == '/user-agreement';
    if (!agreed) {
      return '/user-agreement';
    }

    if (agreeing) {
      return '/';
    }

    return null;
  },
);
