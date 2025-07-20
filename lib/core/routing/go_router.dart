import 'package:go_router/go_router.dart';
import 'auth_guard.dart';
import '../../screens/create_post/view/create_post_screen.dart';
import '../../screens/auth/view/auth_screen.dart';
import '../../screens/home/view/home_screen.dart';
import '../../screens/splash/splash_screen.dart';

final GoRouter appRoute = GoRouter(
  initialLocation: '/',
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
        //! USE AUTHGUARD for AUTH SCREEN
        return const AuthGuard(child: HomeScreen());
      },
    ),
    GoRoute(
      path: '/create-post',
      builder: (context, state) {
        return const AuthGuard(child: CreateScreen());
      },
    ),
  ],
);
