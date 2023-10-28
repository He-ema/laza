import 'package:laza/features/get_started/presentation/views/get_started_view.dart';
import 'package:laza/features/bottom_navigation_bar/presentation/views/bottom_navigation_bar.dart';
import 'package:laza/features/home/data/product_model/product_model.dart';
import 'package:laza/features/home/presentation/views/details_view.dart';
import 'package:laza/features/intro/presntation/views/intro_view.dart';
import 'package:laza/features/signIn/presentation/views/sign_in_view.dart';
import 'package:laza/features/signUp/presentation/views/sign_up_view.dart';
import 'package:laza/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

import '../../features/otp/presentaion/views/otp_view.dart';

abstract class AppRouter {
  static const introRoute = '/intro';
  static const SignInRoute = '/SignIn';
  static const SignUpRoute = '/signUp';
  static const GetStartedViewRoute = '/getStarted';
  static const BottomNavBarRoute = '/BottomNavBar';
  static const otpViewRoute = '/OTP';
  static const detailsRoute = '/details';

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
      GoRoute(
        path: BottomNavBarRoute,
        builder: (context, state) =>
            BottomNavigationBarView(email: state.extra as String),
      ),
      GoRoute(
        path: otpViewRoute,
        builder: (context, state) => const OtpView(),
      ),
    ],
  );
}
