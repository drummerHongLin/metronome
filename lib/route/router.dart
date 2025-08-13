import 'package:flutter/material.dart'
    show CurveTween, Curves, FadeTransition, SafeArea, Theme, Container;
import 'package:flutter_metronome/repo/agreement_repo.dart';

import 'package:flutter_metronome/ui/main_screen.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:flutter_metronome/ui/policy/interaction_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

GoRouter router(AgreementRepo sps) => GoRouter(
  initialLocation: '/user-agreement',
  refreshListenable: sps,
  routes: [
    GoRoute(
      path: '/user-agreement',
      builder: (context, state) => InteractionCard(sps: context.read()),
    ),
    GoRoute(
      path: '/',
      pageBuilder: (context, state) => CustomTransitionPage(
        transitionDuration: Duration(seconds: 1),
        reverseTransitionDuration: Duration(seconds: 1),
        child: Container(
          color: Theme.of(context).colorScheme.surface,
          child: SafeArea(
            child: MainScreen(viewModel: context.read<MainScreenViewModel>()),
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) =>
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
