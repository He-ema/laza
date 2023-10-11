import 'package:laza/features/get_started/presentation/views/get_started_view.dart';
import 'package:laza/features/intro/presntation/views/intro_view.dart';
import 'package:laza/features/signIn/presentation/views/sign_in_view.dart';
import 'package:laza/features/signUp/presentation/views/sign_up_view.dart';
import 'package:laza/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const introRoute = '/intro';
  static const SignInRoute = '/SignIn';
  static const SignUpRoute = '/signUp';
  static const GetStartedViewRoute = '/getStarted';
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: introRoute,
        builder: (context, state) => const IntroView(),
      ),
      GoRoute(
        path: GetStartedViewRoute,
        builder: (context, state) => const GetStartedView(),
      ),
      GoRoute(
        path: SignInRoute,
        builder: (context, state) => const SignInView(),
      ),
      GoRoute(
        path: SignUpRoute,
        builder: (context, state) => const SignUpView(),
      ),
    ],
  );
}
