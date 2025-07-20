import 'package:go_router/go_router.dart';
import 'package:pening_repository_ngr/screens/auth/view/auth_screen.dart';
import 'package:pening_repository_ngr/screens/home/view/home_screen.dart';
import 'package:pening_repository_ngr/screens/splash/splash_screen.dart';

final GoRouter appRoute = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) {
        return const SplashScreen();
      },
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) {
        return const AuthScreen();
      },
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
  ],
);
