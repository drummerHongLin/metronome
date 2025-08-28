import 'package:flutter/material.dart'
    show
        CurveTween,
        Curves,
        FadeTransition,
        SafeArea,
        Theme,
        Container,
        LocalKey,
        Widget,
        Colors,
        Text,
        Center;
import 'package:flutter_metronome/repo/agreement_repo.dart';
import 'package:flutter_metronome/repo/auth_repo.dart';
import 'package:flutter_metronome/ui/auth/forget_password/forget_screen.dart';
import 'package:flutter_metronome/ui/auth/login/login_screen.dart';
import 'package:flutter_metronome/ui/auth/profile/profile_screen.dart';
import 'package:flutter_metronome/ui/auth/profile/widgets/add_avatar.dart';
import 'package:flutter_metronome/ui/auth/profile/widgets/change_password.dart';
import 'package:flutter_metronome/ui/auth/register/register_screen.dart';
import 'package:flutter_metronome/ui/drawer/view_models/sponsorship_view_model.dart';
import 'package:flutter_metronome/ui/drawer/widgets/jinghong_info.dart';
import 'package:flutter_metronome/ui/drawer/widgets/sponsorship_info.dart';
import 'package:flutter_metronome/ui/drawer/widgets/sponsorship_list.dart';
import 'package:flutter_metronome/ui/drawer/widgets/version_info.dart';

import 'package:flutter_metronome/ui/main_screen.dart';
import 'package:flutter_metronome/ui/main_screen_view_model.dart';
import 'package:flutter_metronome/ui/policy/interaction_card.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// 用于弹出额外信息卡
CustomTransitionPage popPage(LocalKey key, Widget poppedScreen) {
  return CustomTransitionPage(
    key: key,
    child: poppedScreen,
    barrierDismissible: true,
    barrierColor: Colors.black38,
    opaque: false,
    transitionDuration: Duration.zero,
    transitionsBuilder: (_, __, ___, Widget child) => child,
  );
}

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
            child: MainScreen(viewModel: context.watch<MainScreenViewModel>()),
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
    GoRoute(
      path: "/users",
      builder: (context, state) => Center(child: Text("404 页面不存在!")),
      routes: [
        GoRoute(
          path: "/login",
          pageBuilder: (context, state) =>
              popPage(state.pageKey, LoginScreen(viewmodel: context.read())),
        ),
        GoRoute(
          path: "/register",
          pageBuilder: (context, state) =>
              popPage(state.pageKey, RegisterScreen(viewmodel: context.read())),
        ),
        GoRoute(
          path: "/forget-password",
          pageBuilder: (context, state) =>
              popPage(state.pageKey, ForgetScreen(viewmodel: context.read())),
        ),
        GoRoute(
          path: "/profile",
          pageBuilder: (context, state) {
            return popPage(
              state.pageKey,
              ProfileScreen(viewmodel: context.read()),
            );
          },
          redirect: (context, state) {
            final token = context.read<AuthRepo>().isLoggedIn;
            // 先做一次判断，如果token失效转到登录页面
            if (!token) {
              return "/users/login";
            }
            return null;
          },
          routes: [
            // 放在这可以共用上级的重定向
            GoRoute(
              path: "/set-avatar",
              pageBuilder: (context, state) =>
                  popPage(state.pageKey, AddAvatar(viewmodel: context.read())),
            ),
            GoRoute(
              path: "/change-password",
              pageBuilder: (context, state) => popPage(
                state.pageKey,
                ChangePassword(viewmodel: context.read()),
              ),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/drawer',
      builder: (context, state) => Center(child: Text("404 页面不存在!")),

      routes: [
        GoRoute(
          path: '/sponsorship',
          pageBuilder: (context, state) => popPage(
            state.pageKey,
            SponsorshipInfo(viewModel: context.read<SponsorshipViewModel>()),
          ),
          routes: [
            GoRoute(
              path: '/list',
              pageBuilder: (context, state) => popPage(
                state.pageKey,
                SponsorshipList(
                  viewModel: context.read<SponsorshipViewModel>(),
                ),
              ),
            ),
          ],
        ),
        GoRoute(
          path: '/version',
          pageBuilder: (context, state) =>
              popPage(state.pageKey, VersionInfo()),
        ),
        GoRoute(
          path: '/about',
          pageBuilder: (context, state) =>
              popPage(state.pageKey, JinghongInfo()),
        ),
      ],
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
