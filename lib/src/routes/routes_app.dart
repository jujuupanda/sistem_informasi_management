import 'package:flutter/cupertino.dart';
import 'package:sistem_informasi_sekolah/src/data/models/event_model.dart';
import 'package:sistem_informasi_sekolah/src/presentation/pages/profile/user_info.dart';

import '../presentation/pages/choice/choice.dart';
import '../presentation/pages/event/detail_event.dart';
import '../presentation/pages/event/event.dart';
import '../presentation/pages/login/login.dart';
import '../presentation/pages/main/main.dart';
import '../presentation/pages/navigation_bar/navigation_bar.dart';
import '../presentation/pages/presence/presence.dart';
import '../presentation/pages/profile/profile.dart';
import '../presentation/pages/register/register.dart';
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
        return BotNavBar(
          navigationShell: navigationShell,
        );
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
              routes: [
                GoRoute(
                    path: 'event',
                    name: Routes.event,
                    builder: (context, state) {
                      return const EventPage();
                    },
                    routes: [
                      GoRoute(
                        path: 'detailEvent',
                        name: Routes.detailEvent,
                        builder: (context, state) {
                          return DetailEventPage(
                            eventModel: state.extra as EventModel,
                          );
                        },
                      ),
                    ]),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _navigatorEvent,
          routes: <RouteBase>[
            GoRoute(
              path: '/presence',
              name: Routes.presence,
              builder: (context, state) {
                return const PresencePage();
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
              routes: [
                GoRoute(
                  path: 'userInfo',
                  name: Routes.userInfo,
                  builder: (context, state) {
                    return const UserInfoPage();
                  },
                ),
              ]
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
          GoRoute(
            path: 'register',
            name: Routes.register,
            builder: (context, state) {
              return const RegisterPage();
            },
          ),
          //Route for register
          //here
        ]),
  ],
);
