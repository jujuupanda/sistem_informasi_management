import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:sistem_informasi_sekolah/src/presentation/pages/event/event.dart';

import '../presentation/pages/choice/choice.dart';
import '../presentation/pages/login/login.dart';
import '../presentation/pages/main/main.dart';
import '../presentation/pages/navigation_bar/navigation_bar.dart';
import '../presentation/pages/profile/profile.dart';
import '../presentation/pages/splash/splash.dart';
import 'name_routes.dart';

final _navigatorMain = GlobalKey<NavigatorState>();
final _navigatorEvent = GlobalKey<NavigatorState>();
final _navigatorProfile = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      name: Routes.splash,
      builder: (context, state) {
        return const SplashPage();
      },
    ),

    ///navigation with parent widget
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return BotNavBar(navigationShell: navigationShell,);
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _navigatorMain,
          routes: <RouteBase>[
            GoRoute(
              path: '/main',
              name: Routes.main,
              builder: (context, state) {
                return const MainPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorEvent,
          routes: <RouteBase>[
            GoRoute(
              path: '/event',
              name: Routes.event,
              builder: (context, state) {
                return const EventPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorProfile,
          routes: <RouteBase>[
            GoRoute(
              path: '/profile',
              name: Routes.profile,
              builder: (context, state) {
                return const ProfilePage();
              },
            ),
          ],
        ),
      ],
    ),

    ///Navigation without parent widget
    GoRoute(
        path: '/choice',
        name: Routes.choice,
        builder: (context, state) {
          return const ChoicePage();
        },
        routes: [
          //Route for login
          GoRoute(
            path: 'login',
            name: Routes.login,
            builder: (context, state) {
              return const LoginPage();
            },
          ),
          //Route for register
          //here
        ]),
  ],
);
