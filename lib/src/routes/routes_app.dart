import 'package:go_router/go_router.dart';
import 'package:sistem_informasi_sekolah/src/presentation/pages/login/login.dart';
import 'package:sistem_informasi_sekolah/src/presentation/pages/main/main.dart';
import 'package:sistem_informasi_sekolah/src/routes/name_routes.dart';


class RoutesApp {
  final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        name: Routes().login,
        builder: (context, state) {
          return const LoginPage();
        },
      ),
      GoRoute(
        path: '/main',
        name: Routes().main,
        builder: (context, state) {
          return const MainPage();
        },
      ),
    ],
  );
}
